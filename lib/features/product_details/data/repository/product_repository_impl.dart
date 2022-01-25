

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository {

  ProductRemoteDataSource productRemoteDataSource;
  NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.productRemoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        List<ProductEntity> product = await productRemoteDataSource
            .getProductDetails();
        return Right(product);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else return Left(ServerFailure());
  }

}