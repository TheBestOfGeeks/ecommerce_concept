import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  CartEntity({
    required this.id,
    required this.delivery,
    required this.total,
    required this.basket,
  });

  String id;
  String delivery;
  int total;
  List<Basket> basket;

  @override
  List<Object?> get props => [id, delivery, total, basket];
}

class Basket extends Equatable {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  int id;
  String images;
  int price;
  String title;

  @override
  List<Object?> get props => [id, images, price, title];
}
