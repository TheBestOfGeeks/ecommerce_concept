import 'package:ecommerce_concept/core/local_db/db_connection.dart';
import 'package:ecommerce_concept/features/home/data/models/home_model.dart';
import 'package:http/http.dart';
import 'package:sqflite/sqflite.dart';

abstract class HomeDBProvider {
  createTable();

  setToDB(data);

  getFromDB();

  tableIsExist();
}

class HomeDBProviderImpl implements HomeDBProvider {
  DbConnection dbConnection;

  HomeDBProviderImpl({required this.dbConnection});

  @override
  createTable() async {
    final db = await dbConnection.getDatabase;
    await db.execute('''
CREATE TABLE IF NOT EXISTS home_entity (
_id TEXT PRIMARY KEY,
home_store TEXT,
best_seller TEXT
)
''');

    await db.execute('''
CREATE TABLE IF NOT EXISTS best_seller (
id INTEGER PRIMARY KEY,
is_favorites TEXT,
title TEXT,
price_without_discount INTEGER,
discount_price INTEGER,
picture TEXT,
local_picture BLOB
)
''');

    await db.execute('''
CREATE TABLE IF NOT EXISTS hot_sales (
id INTEGER PRIMARY KEY,
is_new TEXT,
title TEXT,
subtitle TEXT,
picture TEXT,
is_buy TEXT,
local_picture BLOB
)
''');
  }

  @override
  getFromDB() async {
    List<HomeModel> localHomeModel = [];
    final db = await dbConnection.getDatabase;
    final List<Map<String, dynamic>> bestSeller = await db.query('best_seller');
    final List<Map<String, dynamic>> hotSales = await db.query('hot_sales');

    List<Map<String, dynamic>> homeEntity =
        await db.rawQuery('SELECT * FROM home_entity');

    HomeModel homeModel = HomeModel(
      id: homeEntity.first["_id"],
      best_seller_path: await List.generate(bestSeller.length, (i) {
        return BestSellerModel(
          id: bestSeller[i]['id'],
          isFavorite: bestSeller[i]['is_favorites'] == 1 ? false : true,
          title: bestSeller[i]['title'] ?? '',
          price_without_discount: bestSeller[i]['price_without_discount'] ?? '',
          discount_price: bestSeller[i]['discount_price'] ?? '',
          picture: bestSeller[i]['picture'] ?? '',
          localPicture: bestSeller[i]['local_picture'] ?? '',
        );
      }),
      hot_sales_path: await List.generate(hotSales.length, (i) {
        return HotSalesModel(
          id: hotSales[i]['id'],
          isNew: hotSales[i]['is_new'] == 1 ? false : true,
          title: hotSales[i]['title'] ?? '',
          subtitle: hotSales[i]['subtitle'] ?? '',
          picture: hotSales[i]['picture'] ?? '',
          isBuy: hotSales[i]['is_buy'] == 1 ? false : true,
          localPicture: hotSales[i]['local_picture'] ?? '',
        );
      }),
    );

    localHomeModel.add(homeModel);

    return localHomeModel;
  }

  @override
  setToDB(data) async {
    final db = await dbConnection.getDatabase;
    await db.rawInsert('''
     INSERT INTO home_entity (
     _id,
     home_store,
     best_seller
     ) VALUES (?,?,?)
   ''', [
      data.id.toString(),
      data.hot_sales_path.toString(),
      data.best_seller_path.toString()
    ]);

    data.best_seller_path.forEach((element) async {
// Форматируем картинку в байты для сохранения в БД
      var image = await get(Uri.parse(element.picture));
      var imageBytes = image.bodyBytes;

      await db.rawInsert('''
     INSERT INTO best_seller (
id,
is_favorites,
title,
price_without_discount,
discount_price,
picture,
local_picture
     ) VALUES (?,?,?,?,?,?,?)
   ''', [
        element.id,
        element.isFavorite,
        element.title,
        element.price_without_discount,
        element.discount_price,
        element.picture,
        await imageBytes
      ]);
    });

    data.hot_sales_path.forEach((element) async {
      // Форматируем картинку в байты для сохранения в БД
      var image = await get(Uri.parse(element.picture));
      var imageBytes = image.bodyBytes;

      await db.rawInsert('''
     INSERT INTO hot_sales (
id,
is_new,
title,
subtitle,
picture,
is_buy,
local_picture
    ) VALUES (?,?,?,?,?,?,?)
   ''', [
        element.id,
        element.isNew,
        element.title,
        element.subtitle,
        element.picture,
        element.isBuy,
        imageBytes
      ]);
    });
  }

  @override
  tableIsExist() async {
    final db = await dbConnection.getDatabase;
    int? count = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM home_entity'));
    return count;
  }
}
