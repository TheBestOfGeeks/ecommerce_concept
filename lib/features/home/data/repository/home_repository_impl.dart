

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_source.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_sqlite_data_source.dart';
import 'package:ecommerce_concept/features/home/data/models/home_model.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;


  HomeRepositoryImpl({required this.homeRemoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDocuments(String path) async {


    await HomeDBProvider.instanceDB.database;


    //Формирование модели HomeModel из локальных таблиц в SQLite
    Future<List<HomeModel>> _returnLocalData() async {
      List<HomeModel>  localHomeModel = [];
      List<Map<String, dynamic>> homeEntity = await HomeDBProvider.instanceDB.getData('home_entity');
      List<BestSellerModel> bestSeller = await HomeDBProvider.instanceDB.bestSellerFromSQLite();
      List<HotSalesModel> hotSales = await HomeDBProvider.instanceDB.hotSalesFromSQLite();
      HomeModel homeModel = HomeModel.fromDB(homeEntity, bestSeller, hotSales);
      localHomeModel.add(homeModel);
      return await localHomeModel.toList();
    }


    if (await networkInfo.isConnected) {
      try {
        final allProducts = await homeRemoteDataSource.getHomeDocuments(path);
        String idOfHomeEntityData = await HomeDBProvider.instanceDB.getHomeEntityId();
         // Проверка на наличие записаных данные в SQLite
        if (idOfHomeEntityData != allProducts.first.id) {
          await HomeDBProvider.instanceDB.saveHomeModelToDB(allProducts.first);
          await HomeDBProvider.instanceDB.saveBestSellerToDB(allProducts.first.best_seller_path);
          await HomeDBProvider.instanceDB.saveHotSalesToDB(allProducts.first.hot_sales_path);
        }
        return Right(_returnLocalData());
      } on ServerException  {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(_returnLocalData());
      } on Exception catch (e) {
        print('Вот она ошибка $e');
        return Left(ServerFailure());
      }
    }
  }

  
  
}