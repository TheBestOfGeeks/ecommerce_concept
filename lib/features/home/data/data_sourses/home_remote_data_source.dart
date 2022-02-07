import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/retrofit/retrofit.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeEntity>> getHomeDocuments(String path);
}

/// GET - https://shopapi-0575.restdb.io/rest/home

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<HomeEntity>> getHomeDocuments(String path) async {
    try {
      final client =
          await APIClient(Dio(BaseOptions(contentType: "application/json")));
      List<HomeEntity> homeList = await client.getHomeData();
      return homeList;
    } on Exception  {
      return throw ServerException();
    }
  }
}

////Старый вариант получения данных из API без использования ретрофита
/*final response = await client.get(Uri.parse('https://shopapi-0575.restdb.io/rest/$path'), headers: <String, String>{'x-apikey': '61ddae2e95cb716ea5ee48e4'});
if (response.statusCode == 200) {
  List<dynamic> documents = json.decode(response.body);
  return documents.map((product) => HomeModel.fromJson(product)).toList();
} else {
  throw ServerException();
}*/
