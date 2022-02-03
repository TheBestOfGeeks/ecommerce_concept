import 'package:ecommerce_concept/features/cart/data/models/CartModel.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/product_details/data/models/product_model.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDBProvider {
  CartDBProvider._init();

  static final CartDBProvider instanceDB = CartDBProvider._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return await _database!;
    } else {
      _database = await _initDB();
      return await _database!;
    }
  }

  Future<Database> _initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'cart_local.db'),
        version: 1, onCreate: _createDB);
  }

  closeDB() async {
    final db = await _database;
    await db!.close();
  }

  Future<int?> tableIsEmpty() async {
    final db = await _database;
    int? count = Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM cart_entity'));
    return count;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE cart_entity (
id TEXT PRIMARY KEY,
delivery TEXT,
total INTEGER
)
''');

    await db.execute('''
      CREATE TABLE basket (
  id INTEGER PRIMARY KEY,
  images TEXT,
  price INTEGER,
  title TEXT,
  local_image BLOB
      )
    ''');
  }

  saveCartModelToDB(List<CartEntity> cartEntity) async {
    final db = await _database;

    cartEntity.forEach((element) async {
      await db!.rawInsert('''
      INSERT INTO cart_entity (
id,
delivery,
total
    ) VALUES (?,?,?)
    ''', [element.id, element.delivery, element.total]);

      element.basket.forEach((element) async {
        var image = await get(Uri.parse(element.image));
        var imageBytes = image.bodyBytes;

        await db.rawInsert('''
      INSERT INTO basket (
  id,
  images,
  price,
  title,
  local_image
    ) VALUES (?,?,?,?,?)
    ''', [element.id, element.image, element.price, element.title, imageBytes]);
      });
    });
  }

  Future<List<CartModel>> cartModelFromSQLite() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db!.query('cart_entity');
    final List<Map<String, dynamic>> basket = await db.query('basket');

    return List.generate(maps.length, (i) {
      return CartModel(
          id: maps[i]['id'],
          delivery: maps[i]['delivery'],
          total: maps[i]['total'],
          basket: List.generate(basket.length, (i) {
            return BasketModel(
              id: basket[i]['id'],
              title: basket[i]['title'] ?? '',
              price: basket[i]['price'] ?? '',
              image: basket[i]['images'] ?? '',
              localImage: basket[i]['local_image'] ?? '',
            );
          }));
    });
  }
}
