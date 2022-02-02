import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/cart/data/repository/Cart_products_repository_impl.dart';
import 'package:ecommerce_concept/features/cart/domain/repository/cart_products_repository.dart';
import 'package:ecommerce_concept/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_bloc.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_source.dart';
import 'package:ecommerce_concept/features/home/data/repository/home_repository_impl.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';
import 'package:ecommerce_concept/features/home/domain/usecases/get_documents.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_concept/features/product_details/data/repository/product_repository_impl.dart';
import 'package:ecommerce_concept/features/product_details/domain/repository/product_repository.dart';
import 'package:ecommerce_concept/features/product_details/domain/use_cases/getProductDetails.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/platform/network_info.dart';
import 'features/cart/domain/use_cases/get_cart_products.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';

final sl = GetIt.instance;

init() {
  // Bloc
  sl.registerFactory(() => HomeBloc(getDocuments: sl()));
  sl.registerFactory(() => ProductBloc(productDetails: sl()));
  sl.registerFactory(() => CartBloc(getCartProducts: sl()));
  sl.registerFactory(() => CartItemsBloc(getCartItems:   sl()));

  // UseCases
  sl.registerLazySingleton(() => GetDocuments(homeRepository: sl()));
  sl.registerLazySingleton(() => GetProductDetails(productRepository: sl()));
  sl.registerLazySingleton(() => GetCartProducts(cartProductsRepository: sl()));
  sl.registerLazySingleton(() => GetCartItems(cartProductsRepository: sl()));
  //Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<ProductRepository>(() =>
      ProductRepositoryImpl(productRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<CartProductsRepository>(() =>
      CartProductsRepositoryImpl(
          cartRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(client: http.Client()));
//core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
