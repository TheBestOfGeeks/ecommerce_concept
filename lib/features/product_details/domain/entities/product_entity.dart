import 'dart:typed_data';

class ProductEntity {
  ProductEntity({
    required this.id,
    required this.cpu,
    required this.camera,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
    required this.images,
    required this.color,
    required this.capacity,
    required this.localImages,
  });

  final String id;
  final String cpu;
  final String camera;
  final bool isFavorites;
  final int price;
  final int rating;
  final String sd;
  final String ssd;
  final String title;
  final List<String> images;
  final List<String> color;
  final List<String> capacity;
  final List<Uint8List> localImages;
}

