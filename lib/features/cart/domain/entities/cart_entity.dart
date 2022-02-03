import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  CartEntity({
    required this.id,
    required this.delivery,
    required this.total,
    required this.basket,
  });

  final String id;
  final String delivery;
  final int total;
  final List<Basket> basket;

  @override
  List<Object?> get props => [id, delivery, total, basket];
}

class Basket extends Equatable {
  Basket({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.localImage,
  });

  final int id;
  final String image;
  final int price;
  final String title;
  final Uint8List localImage;

  @override
  List<Object?> get props => [id, image, price, title];
}
