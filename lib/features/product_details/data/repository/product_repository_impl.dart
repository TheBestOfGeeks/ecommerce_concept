

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_sqlite_data_source.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository {

  ProductRemoteDataSource productRemoteDataSource;
  NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.productRemoteDataSource,required this.networkInfo});


  //Формирование модели ProductModel из локальных таблиц в SQLite
  Future<List<ProductEntity>> _returnLocalData() async {
    List<ProductEntity> localProductModel = await ProductDBProvider.instanceDB.productModelFromSQLite();
    return localProductModel;
  }


  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {

    await ProductDBProvider.instanceDB.database;

    if (await networkInfo.isConnected) {
      try {
        List<ProductEntity> product = await productRemoteDataSource.getProductDetails();

        // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
        int? tableIsEmpty = await ProductDBProvider.instanceDB.tableIsEmpty();
        if (tableIsEmpty == 0) {
         await ProductDBProvider.instanceDB.saveProductModelToDB(product);
        }


        return Right(await _returnLocalData());
      } on ServerException {
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