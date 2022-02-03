
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
    Future<List<HomeEntity>> _returnLocalData() async {

      List<HomeEntity> localHomeModel = await HomeDBProvider.instanceDB.HomeEntityFromSQLite();
      return await localHomeModel;
    }


    if (await networkInfo.isConnected) {
      try {
        final allProducts = await homeRemoteDataSource.getHomeDocuments(path);
        // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
        int? tableIsEmpty = await HomeDBProvider.instanceDB.tableIsEmpty();
        if (tableIsEmpty == 0) {
          await HomeDBProvider.instanceDB.saveHomeModelToDB(allProducts.first);
        }
        return  Right(await _returnLocalData());
      } on ServerException  {
        return Left(ServerFailure());
      }
    } else {
      try {
        return Right(await _returnLocalData());
      } on  StateError {
        return Left(ServerFailure());
      }
    }
  }

  
  
}