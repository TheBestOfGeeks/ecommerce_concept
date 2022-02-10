import 'dart:typed_data';

import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String id,
    required String cpu,
    required String camera,
    required bool isFavorites,
    required int price,
    required int rating,
    required String sd,
    required String ssd,
    required String title,
    required List<String> images,
    required List<String> color,
    required List<String> capacity,
    required List<Uint8List> localImages,
  }) : super(
      id: id,
      cpu: cpu,
      camera: camera,
      isFavorites: isFavorites,
      price: price,
      rating: rating,
      sd: sd,
      ssd: ssd,
      title: title,
      images: images,
      color: color,
      capacity: capacity,
      localImages: localImages);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<Uint8List> t = [];

    return ProductModel(
      id: json["_id"],
      cpu: json["CPU"],
      camera: json["camera"],
      isFavorites: json["isFavorites"],
      price: json["price"],
      rating: json["rating"],
      sd: json["sd"],
      ssd: json["ssd"],
      title: json["title"],
      images: List<String>.from(json["images"].map((x) => x)),
      color: List<String>.from(json["color"].map((x) => x)),
      capacity: List<String>.from(json["capacity"].map((x) => x)),
      localImages: t,
    );
  }


  Map<String, dynamic> toJson() =>
      {
        "_id": id,
        "CPU": cpu,
        "camera": camera,
        "isFavorites": isFavorites,
        "price": price,
        "rating": rating,
        "sd": sd,
        "ssd": ssd,
        "title": title,
        "images":
        images ==  List<dynamic>.from(images.map((x) => x)),
        "color": color ==  List<dynamic>.from(color.map((x) => x)),
        "capacity": capacity ==  List<dynamic>.from(capacity.map((x) => x)),
      };
}
