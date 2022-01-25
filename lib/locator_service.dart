

import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_sourse.dart';
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

final sl = GetIt.instance;

init() {

  // Bloc
  sl.registerFactory(() => HomeBloc(getDocuments: sl()));
  sl.registerFactory(() => ProductBloc(productDetails: sl()));

  // UseCases
sl.registerLazySingleton(() => GetDocuments(sl()));
sl.registerLazySingleton(() => GetProductDetails(productRepository: sl()));
  //Repository
sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: sl(), networkInfo: sl()));
sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(client: http.Client()));
sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(productRemoteDataSource: sl(), networkInfo: sl()));
sl.registerLazySingleton<ProductRemoteDataSource>(() => ProductRemoteDataSourceImpl(client: http.Client()));

//core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());

}