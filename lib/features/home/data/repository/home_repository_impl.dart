
import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_source.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_db_provider.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeDBProvider homeDBProvider;
  final NetworkInfo networkInfo;


  HomeRepositoryImpl({required this.homeRemoteDataSource,required this.networkInfo, required this.homeDBProvider});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDocuments(String path) async {


    await homeDBProvider.createTable();

    //Формирование модели HomeModel из локальных таблиц в local_db
    Future<List<HomeEntity>> _returnLocalData() async {
      List<HomeEntity> localHomeModel = await homeDBProvider.getFromDB();
      return await localHomeModel;
    }


    if (await networkInfo.isConnected) {
      try {
        final allProducts = await homeRemoteDataSource.getHomeDocuments(path);
        // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
        int? tableIsEmpty = await homeDBProvider.tableIsExist();
        if (tableIsEmpty == 0) {
          await homeDBProvider.setToDB(allProducts.first);
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