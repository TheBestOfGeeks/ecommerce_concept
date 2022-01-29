import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/error/exception.dart';
import '../models/CartModel.dart';

abstract class CartRemoteDataSource {
  Future<List<CartEntity>> getCartDocument();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CartEntity>> getCartDocument() async {
    final response = await client.get(
        Uri.parse(
          'https://shopapi-0575.restdb.io/rest/cart',
        ),
        headers: <String, String>{'x-apikey': '61ddae2e95cb716ea5ee48e4'});
    if (response.statusCode == 200) {
      List<dynamic> documents = jsonDecode(response.body);
      return documents.map((e) => CartModel.fromJson(e)).toList();
    } else {
      return throw ServerException();
    }
  }
}
