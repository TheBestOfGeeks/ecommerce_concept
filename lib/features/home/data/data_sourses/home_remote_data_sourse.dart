

import 'dart:convert';

import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_concept/features/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {




  /// https://shopapi-0575.restdb.io/rest/"end point"

  Future<List<HomeEntity>> getHomeDocuments(String path);

}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeEntity>> getHomeDocuments(String path) async {
final response = await client.get(Uri.parse('https://shopapi-0575.restdb.io/rest/$path'), headers: <String, String>{'x-apikey': '61ddae2e95cb716ea5ee48e4'});
if (response.statusCode == 200) {
  List<dynamic> documents = json.decode(response.body);
  return documents.map((product) => HomeModel.fromJson(product)).toList();
} else {
  throw ServerException();
}
  }


}