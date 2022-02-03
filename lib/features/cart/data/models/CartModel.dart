import 'dart:typed_data';

import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel(
      {required String id,
      required String delivery,
      required int total,
      required List<BasketModel> basket})
      : super(id: id, delivery: delivery, total: total, basket: basket);

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["_id"],
        delivery: json["delivery"],
        total: json["total"],
        basket: List<BasketModel>.from(
            json["basket"].map((x) => BasketModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "delivery": delivery,
        "total": total,
        "basket": List<dynamic>.from(basket),
      };
}

class BasketModel extends Basket {
  BasketModel({required int id,
    required String image,
    required int price,
    required String title,
    required Uint8List localImage})
      : super(id: id,
      image: image,
      price: price,
      title: title,
      localImage: localImage);

  factory BasketModel.fromJson(Map<String, dynamic> json) {

    Uint8List t = Uint8List(555);

  return  BasketModel(
        id: json["id"],
        image: json["images"],
        price: json["price"],
        title: json["title"],
localImage: t,
      );
}

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": image,
        "price": price,
        "title": title,
      };
}
