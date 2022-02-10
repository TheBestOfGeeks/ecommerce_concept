import 'package:dio/dio.dart';
import 'package:ecommerce_concept/features/cart/data/models/CartModel.dart';
import 'package:ecommerce_concept/features/home/data/models/home_model.dart';
import 'package:ecommerce_concept/features/product_details/data/models/product_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart' as http;

part 'retrofit.g.dart';

const headerKey = 'x-apikey';
const HeaderValue = '61ddae2e95cb716ea5ee48e4';

// *** CLIENT *** //
@RestApi(baseUrl: "https://shopapi-0575.restdb.io/rest/")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  // ===== GET HOME DATA ===== //
  @GET("home")
  @http.Headers(<String, dynamic>{
    headerKey: HeaderValue,
  })
  Future<List<HomeModel>> getHomeData();

  // ===== GET PRODUCT DATA ===== //
  @GET("detail")
  @http.Headers(<String, dynamic>{
    headerKey: HeaderValue,
  })
  Future<List<ProductModel>> getProductData();

  // ===== GET CART DATA ===== //
  @GET("cart")
  @http.Headers(<String, dynamic>{
    headerKey: HeaderValue,
  })
  Future<List<CartModel>> getCartData();
}
