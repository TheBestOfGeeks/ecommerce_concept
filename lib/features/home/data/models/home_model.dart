import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {required String id,
      required List<BestSellerEntity> best_seller_path,
      required List<HotSalesEntity> hot_sales_path})
      : super(
            id: id,
            best_seller_path: best_seller_path,
            hot_sales_path: hot_sales_path);

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json["_id"],
      hot_sales_path: List<HotSalesModel>.from(
          json["home_store"].map((e) => HotSalesModel.fromJson(e))),
      best_seller_path: List<BestSellerModel>.from(
          json["best_seller"].map((e) => BestSellerModel.fromJson(e))),
    );
  }

  factory HomeModel.fromDB(List<Map<String, dynamic>> homeEntity,
      List<BestSellerModel> bestSeller, List<HotSalesModel> hotSales) {
    return HomeModel(
      id: homeEntity.first["_id"],
      hot_sales_path: hotSales,
      best_seller_path: bestSeller,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "home_store": hot_sales_path == null
          ? null
          : List<dynamic>.from(hot_sales_path.map((x) => x)),
      "best_seller": best_seller_path == null
          ? null
          : List<dynamic>.from(best_seller_path.map((x) => x)),
    };
  }
}

class BestSellerModel extends BestSellerEntity {
  BestSellerModel({
    required int id,
    required bool isFavorite,
    required String title,
    required int price_without_discount,
    required int discount_price,
    required String picture,
  }) : super(
          id: id,
          isFavorite: isFavorite,
          title: title,
          price_without_discount: price_without_discount,
          discount_price: discount_price,
          picture: picture,
        );

  factory BestSellerModel.fromJson(Map<String, dynamic> json) {
    return BestSellerModel(
      id: json["id"],
      isFavorite: json["is_favorites"],
      title: json["title"],
      price_without_discount: json["price_without_discount"],
      discount_price: json["discount_price"],
      picture: json["picture"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "is_favorites": isFavorite,
      "title": title,
      "price_without_discount": price_without_discount,
      "discount_price": discount_price,
      "picture": picture,
    };
  }
}

class HotSalesModel extends HotSalesEntity {
  HotSalesModel(
      {required int id,
      required bool isNew,
      required String title,
      required String subtitle,
      required String picture,
      required bool isBuy})
      : super(
            id: id,
            isNew: isNew,
            title: title,
            subtitle: subtitle,
            picture: picture,
            isBuy: isBuy);

  factory HotSalesModel.fromJson(Map<String, dynamic> json) {
    return HotSalesModel(
        id: json["id"],
        isNew: json["is_new"] == null ? false : json["is_new"],
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        isBuy: json["is_buy"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "is_new": isNew,
      "title": title,
      "subtitle": subtitle,
      "picture": picture,
      "is_buy": isBuy,
    };
  }
}
