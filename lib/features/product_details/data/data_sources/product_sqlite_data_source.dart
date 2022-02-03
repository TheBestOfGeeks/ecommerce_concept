import 'package:ecommerce_concept/features/product_details/data/models/product_model.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductDBProvider {
  ProductDBProvider._init();

  static final ProductDBProvider instanceDB = ProductDBProvider._init();

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
    return await openDatabase(
        join(await getDatabasesPath(), 'product_local.db'),
        version: 1,
        onCreate: _createDB);
  }

  closeDB() async {
    final db = await _database;
    await db!.close();
  }

  Future<int?> tableIsEmpty() async {
    final db = await _database;
    int? count = Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM product_entity'));
    return count;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE product_entity (
id TEXT PRIMARY KEY,
cpu TEXT,
camera TEXT,
is_favorites TEXT,
price INTEGER,
rating INTEGER,
sd TEXT,
ssd TEXT,
title TEXT
)
''');

    await db.execute('''
      CREATE TABLE images (
      image TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE colors (
      color TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE capacities (
      capacity TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE local_images (
      image BLOB
      )
    ''');
  }

  saveProductModelToDB(List<ProductEntity> productEntity) async {
    final db = await _database;

    productEntity.forEach((element) async {
      await db!.rawInsert('''
      INSERT INTO product_entity (
id,
cpu,
camera,
is_favorites,
price,
rating,
sd,
ssd,
title
    ) VALUES (?,?,?,?,?,?,?,?,?)
    ''', [
        element.id,
        element.cpu,
        element.camera,
        element.isFavorites,
        element.price,
        element.rating,
        element.sd,
        element.ssd,
        element.title
      ]);

      element.images.forEach((element) async {
      await db.rawInsert('''
      INSERT INTO images (
image
    ) VALUES (?)
    ''', [element]);
      });

      element.color.forEach((element) async {
      await db.rawInsert('''
      INSERT INTO colors (
color
    ) VALUES (?)
    ''', [element]);
      });

      element.capacity.forEach((element) async {
      await db.rawInsert('''
      INSERT INTO capacities (
capacity
    ) VALUES (?)
    ''', [element]);
      });

      element.images.forEach((element) async {
      var image = await get(Uri.parse(element));
      var imageBytes = image.bodyBytes;
      await db.rawInsert('''
      INSERT INTO local_images (
image
    ) VALUES (?)
    ''', [imageBytes]);
      });
    });

  }


  Future<List<ProductModel>> productModelFromSQLite() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db!.query('product_entity');
    final List<Map<String, dynamic>> images = await db.query('images');
    final List<Map<String, dynamic>> colors = await db.query('colors');
    final List<Map<String, dynamic>> capacities = await db.query('capacities');
    final List<Map<String, dynamic>> localImages = await db.query('local_images');

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'],
        camera: maps[i]['camera'],
        cpu: maps[i]['cpu'],
        isFavorites: maps[i]['is_favorites'] == 1 ? false : true,
        price: maps[i]['price'],
        rating: maps[i]['rating'],
        sd: maps[i]['sd'],
        ssd: maps[i]['ssd'],
        title: maps[i]['title'],
        color: List.generate(colors.length, (index) =>  colors[index]['color']),
        images: List.generate(images.length, (index) =>  images[index]['image']),
        capacity: List.generate(capacities.length, (index) =>  capacities[index]['capacity']),
        localImages: List.generate(localImages.length, (index) =>  localImages[index]['image']),
      );
    });
  }
}
