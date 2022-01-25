

import 'dart:convert';

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
final responce = await client.get(Uri.parse('https://shopapi-0575.restdb.io/rest/detail'), headers: <String, String> {'x-apikey': '61ddae2e95cb716ea5ee48e4'});
if (responce.statusCode == 200) {
List<dynamic> product = json.decode(responce.body);
return product.map((e) => ProductModel.fromJson(e)).toList();
} else {
  return throw ServerException();
}
  }
 }
