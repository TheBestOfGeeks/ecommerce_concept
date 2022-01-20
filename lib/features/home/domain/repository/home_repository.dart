


import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';


abstract class HomeRepository {

  Future <Either<Failure, List<HotSalesEntity>>> getHotSalesDocuments(String path);

  Future <Either<Failure, List<BestSellerEntity>>> getBestSellerDocuments(String path);
}