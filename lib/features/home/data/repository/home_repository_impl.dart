

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<HomeEntity>>> getAllDocuments(String path) async {
    try {
      final bestSellerProducts = await homeRemoteDataSource.getHomeDocuments(path);
      return Right(bestSellerProducts);
    } on ServerException  {
      return Left(ServerFalure());
    }
  }

  
  
}