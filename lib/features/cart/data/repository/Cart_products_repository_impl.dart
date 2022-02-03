import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_sqlite_data_source.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/domain/repository/cart_products_repository.dart';

class CartProductsRepositoryImpl implements CartProductsRepository {
  CartRemoteDataSource cartRemoteDataSource;
  NetworkInfo networkInfo;

  CartProductsRepositoryImpl(
      {required this.cartRemoteDataSource, required this.networkInfo});

  //Формирование модели ProductModel из локальных таблиц в SQLite
  Future<List<CartEntity>> _returnLocalData() async {
    List<CartEntity> localProductModel = await CartDBProvider.instanceDB.cartModelFromSQLite();
    return localProductModel;
  }


  @override
  Future<Either<Failure, List<CartEntity>>> getCartProducts() async {

    await CartDBProvider.instanceDB.database;

    if (await networkInfo.isConnected) {
      final cartDocuments = await cartRemoteDataSource.getCartDocument();

      // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
      int? tableIsEmpty = await CartDBProvider.instanceDB.tableIsEmpty();
      if (tableIsEmpty == 0) {
        await CartDBProvider.instanceDB.saveCartModelToDB(cartDocuments);
      }


      return Right(await _returnLocalData());
    } else {
      try {
        return Right(await _returnLocalData());
      } on  StateError {
        return Left(ServerFailure());
      }
    }
  }
}
