
import 'package:ecommerce_concept/core/local_db/db_connection.dart';
import 'package:ecommerce_concept/features/cart/data/models/CartModel.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';

abstract class CartDBProvider {
  createTable();

  setToDB(data);

  getFromDB();

  tableIsExist();
}

class CartDBProviderImpl implements CartDBProvider {
  DbConnection dbConnection;

  CartDBProviderImpl({required this.dbConnection});



  @override
  createTable() async {
    final db = await dbConnection.getDatabase;
    await db.execute('''
CREATE TABLE IF NOT EXISTS cart_entity (
id TEXT PRIMARY KEY,
delivery TEXT,
total INTEGER
)
''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS basket (
  id INTEGER PRIMARY KEY,
  images TEXT,
  price INTEGER,
  title TEXT,
  local_image BLOB
      )
    ''');
  }

  @override
  getFromDB() async {
    final db = await dbConnection.getDatabase;

    final List<Map<String, dynamic>> maps = await db.query('cart_entity');
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

  @override
  setToDB(data) async {
    final db = await dbConnection.getDatabase;

    data.forEach((element) async {
      await db.rawInsert('''
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

  @override
  tableIsExist() async {
    final db = await dbConnection.getDatabase;
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM cart_entity'));
    return count;
  }
}


