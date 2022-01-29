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
  BasketModel(
      {required int id,
      required String images,
      required int price,
      required String title})
      : super(id: id, images: images, price: price, title: title);

  factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
        id: json["id"],
        images: json["images"],
        price: json["price"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "price": price,
        "title": title,
      };
}
