

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({required this.homeRemoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDocuments(String path) async {
    if (await networkInfo.isConnected) {
      try {
        final allProducts = await homeRemoteDataSource.getHomeDocuments(path);
        return Right(allProducts);
      } on ServerException  {
        return Left(ServerFailure());
      }
    } return Left(ServerFailure());
  }

  
  
}