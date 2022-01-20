import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {required int id,
      required List<BestSellerEntity> best_seller_path,
      required List<HotSalesEntity> hot_sales_path})
      : super(
            id: id,
            best_seller_path: best_seller_path,
            hot_sales_path: hot_sales_path);
  
  
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
    id: json['id'],
    best_seller_path: List<BestSellerModel>.from(json["best_seller"].map((e) => BestSellerModel.fromJson(e))),
      hot_sales_path: List<HotSalesModel>.from(json["home_store"].map((e) => HotSalesModel.fromJson(e))),
    );
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
      id: json['id'],
      isFavorite: json['isFavorite'],
      title: json['title'],
      price_without_discount: json['price_without_discount'],
      discount_price: json['discount_price'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {};
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
        id: json['id'],
        isNew: json['isNew'],
        title: json['title'],
        subtitle: json['subtitle'],
        picture: json['picture'],
        isBuy: json['isBuy']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isNew': isNew,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'isBuy': isBuy,
    };
  }
}
