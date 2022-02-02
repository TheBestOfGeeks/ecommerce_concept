import 'package:ecommerce_concept/features/home/data/models/home_model.dart';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomeDBProvider {
  HomeDBProvider._init();

  static final HomeDBProvider instanceDB = HomeDBProvider._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'home_local.db'),
        version: 1, onCreate: _createDB);
  }


  Future<List<Map<String, dynamic>>> getData(String nameOfPath) async {
    final db = await _database;
    return await db!.rawQuery('SELECT * FROM $nameOfPath');

  }

  Future<String> getHomeEntityId() async {
    final db = await _database;
    final List<Map<String, dynamic>> query = await db!.query('home_entity');
    return query[0]['_id'];
  }

  Future<Database> closeDB() async {
    final db = await instanceDB._initDB();
    return db;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE home_entity (
_id TEXT PRIMARY KEY,
home_store TEXT,
best_seller TEXT
)
''');

    await db.execute('''
CREATE TABLE best_seller (
id INTEGER PRIMARY KEY,
is_favorites TEXT,
title TEXT,
price_without_discount INTEGER,
discount_price INTEGER,
picture TEXT
)
''');

    await db.execute('''
CREATE TABLE hot_sales (
id INTEGER PRIMARY KEY,
is_new TEXT,
title TEXT,
subtitle TEXT,
picture TEXT,
is_buy TEXT
)
''');
  }

  saveHomeModelToDB(HomeEntity homeEntity) async {
    final db = await _database;
    await db!.rawInsert('''
     INSERT INTO home_entity (
     _id,
     home_store,
     best_seller
     ) VALUES (?,?,?)
   ''', [
      homeEntity.id.toString(),
      homeEntity.hot_sales_path.toString(),
      homeEntity.best_seller_path.toString()
    ]);
  }

  saveBestSellerToDB(List<BestSellerEntity> bestSellerEntity) async {
    final db = await _database;

    bestSellerEntity.forEach((element) async {
      await db!.rawInsert('''
     INSERT INTO best_seller (
id,
is_favorites,
title,
price_without_discount,
discount_price,
picture
     ) VALUES (?,?,?,?,?,?)
   ''', [
        element.id,
        element.isFavorite,
        element.title,
        element.price_without_discount,
        element.discount_price,
        element.picture
      ]);
    });
  }

  saveHotSalesToDB(List<HotSalesEntity> hotSalesEntity) async {
    final db = await _database;

    hotSalesEntity.forEach((element) async {
      await db!.rawInsert('''
     INSERT INTO hot_sales (
id,
is_new,
title,
subtitle,
picture,
is_buy
    ) VALUES (?,?,?,?,?,?)
   ''', [
        element.id,
        element.isNew,
        element.title,
        element.subtitle,
        element.picture,
        element.isBuy
      ]);
    });
  }

  Future<List<BestSellerModel>> bestSellerFromSQLite() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db!.query('best_seller');

    return List.generate(maps.length, (i) {
      return BestSellerModel(
        id: maps[i]['id'],
        isFavorite: maps[i]['is_favorites'] == 1 ? true : false,
        title: maps[i]['title'] ?? '',
        price_without_discount: maps[i]['price_without_discount'] ?? '',
        discount_price: maps[i]['discount_price'] ?? '',
        picture: maps[i]['picture'] ?? '',
      );
    });
  }

  Future<List<HotSalesModel>> hotSalesFromSQLite() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db!.query('hot_sales');

    return List.generate(maps.length, (i) {
      return HotSalesModel(
        id: maps[i]['id'],
        isNew: maps[i]['is_new'] == 1 ? true : false,
        title: maps[i]['title'] ?? '',
        subtitle: maps[i]['subtitle'] ?? '',
        picture: maps[i]['picture'] ?? '',
        isBuy: maps[i]['is_buy'] == 1 ? true : false,
      );
    });
  }
}
