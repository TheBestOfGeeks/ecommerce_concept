

import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class BestSellerEntity extends Equatable {

  final int id;
  final bool isFavorite;
  final String title;
  final int price_without_discount;
  final int discount_price;
  final String picture;
  final Uint8List  localPicture;

  BestSellerEntity(
      {required this.id,
        required this.isFavorite,
        required this.title,
        required this.price_without_discount,
        required this.discount_price,
        required this.picture,
        required this.localPicture,});


  @override
  List<Object?> get props => [id, isFavorite, title, price_without_discount, discount_price, picture ];

}
