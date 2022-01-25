import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel(
      {required String id,
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
      required List<String> capacity})
      : super(
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
            capacity: capacity);



  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["_id"] == null ? null : json["_id"],
      cpu: json["CPU"] == null ? null : json["CPU"],
      camera: json["camera"] == null ? null : json["camera"],
      isFavorites: json["isFavorites"] == null ? null : json["isFavorites"],
      price: json["price"] == null ? null : json["price"],
      rating: json["rating"] == null ? null : json["rating"],
      sd: json["sd"] == null ? null : json["sd"],
      ssd: json["ssd"] == null ? null : json["ssd"],
      title: json["title"] == null ? null : json["title"],
      images: List<String>.from(json["images"].map((x) => x)),
      color:  List<String>.from(json["color"].map((x) => x)),
      capacity: List<String>.from(json["capacity"].map((x) => x)),
  );





  Map<String, dynamic> toJson() => {
      "_id": id == null ? null : id,
      "CPU": cpu == null ? null : cpu,
      "camera": camera == null ? null : camera,
      "isFavorites": isFavorites == null ? null : isFavorites,
      "price": price == null ? null : price,
      "rating": rating == null ? null : rating,
      "sd": sd == null ? null : sd,
      "ssd": ssd == null ? null : ssd,
      "title": title == null ? null : title,
      "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
      "color": color == null ? null : List<dynamic>.from(color.map((x) => x)),
      "capacity": capacity == null ? null : List<dynamic>.from(capacity.map((x) => x)),
  };

}
