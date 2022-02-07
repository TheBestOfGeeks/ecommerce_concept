import 'package:dio/dio.dart';
import 'package:ecommerce_concept/core/retrofit/retrofit.dart';
import 'package:ecommerce_concept/features/product_details/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';

import '../../../../core/error/exception.dart';

abstract class ProductRemoteDataSource {
  /// GET - https://shopapi-0575.restdb.io/rest/detail

  Future<List<ProductEntity>> getProductDetails();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getProductDetails() async {
    try {
      final client =
          await APIClient(Dio(BaseOptions(contentType: "application/json")));
      List<ProductModel> productList = await client.getProductData();
      return productList;
    } on Exception {
      return throw ServerException();
    }
  }
}

////Старый вариант получения данных из API без использования ретрофита
/*
final response = await client.get(Uri.parse('https://shopapi-0575.restdb.io/rest/detail'), headers: <String, String> {'x-apikey': '61ddae2e95cb716ea5ee48e4'});
if (response.statusCode == 200) {
List<dynamic> product = json.decode(response.body);
return product.map((e) => ProductModel.fromJson(e)).toList();
} else {
return throw ServerException();
}*/
