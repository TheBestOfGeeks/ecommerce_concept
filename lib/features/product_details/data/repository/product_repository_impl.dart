

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_remote_data_source.dart';
import 'package:ecommerce_concept/features/product_details/data/data_sources/product_db_provider.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import '../../../../core/error/exception.dart';
import '../../domain/repository/product_repository.dart';


class ProductRepositoryImpl implements ProductRepository {

  ProductRemoteDataSource productRemoteDataSource;
  ProductDBProvider productDBProvider;
  NetworkInfo networkInfo;

  ProductRepositoryImpl({required this.productRemoteDataSource,required this.networkInfo, required this.productDBProvider});


  //Формирование модели ProductModel из локальных таблиц в local_db
  Future<List<ProductEntity>> _returnLocalData() async {
    List<ProductEntity> localProductModel = await productDBProvider.getFromDB();
    return localProductModel;
  }


  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {

    await productDBProvider.createTable();

    if (await networkInfo.isConnected) {
      try {
        List<ProductEntity> product = await productRemoteDataSource.getProductDetails();

        // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
        int? tableIsEmpty = await productDBProvider.tableIsExist();
        if (tableIsEmpty == 0) {
         await productDBProvider.setToDB(product);
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