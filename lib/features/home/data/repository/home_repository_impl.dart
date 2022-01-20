

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/exception.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/home/data/data_sourses/home_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestSellerDocuments(String path) async {
    try {
      final bestSellerProducts = await homeRemoteDataSource.getBestSellerDocuments(path);
      return Right(bestSellerProducts);
    } on ServerException  {
      return Left(ServerFalure());
    }
  }

  @override
  Future<Either<Failure, List<HotSalesEntity>>> getHotSalesDocuments(String path) async {
    try {
      final HotSalesProducts = await homeRemoteDataSource.getHotSalesDocuments(path);
      return Right(HotSalesProducts);
    } on ServerException  {
      return Left(ServerFalure());
    }
  }
  
  
}