import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_db_provider.dart';
import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/domain/repository/cart_products_repository.dart';

class CartProductsRepositoryImpl implements CartProductsRepository {
  CartRemoteDataSource cartRemoteDataSource;
  CartDBProvider cartDBProvider;
  NetworkInfo networkInfo;

  CartProductsRepositoryImpl(
      {required this.cartRemoteDataSource,
      required this.networkInfo,
      required this.cartDBProvider});

  //Формирование модели ProductModel из локальных таблиц в SQLite
  Future<List<CartEntity>> _returnLocalData() async {
    List<CartEntity> localProductModel = await cartDBProvider.getFromDB();
    return localProductModel;
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCartProducts() async {
    if (await networkInfo.isConnected) {
      final cartDocuments = await cartRemoteDataSource.getCartDocument();

      await cartDBProvider.createTable();

      // проверяет пуста ли таблица базы, если да то заполняет её данными из сети
      int tableIsEmpty = await cartDBProvider.tableIsExist();

      if (tableIsEmpty == 0) {
        await cartDBProvider.setToDB(cartDocuments);
      }

      return Right(await _returnLocalData());
    } else {
      try {
        return Right(await _returnLocalData());
      } on StateError {
        return Left(ServerFailure());
      }
    }
  }
}
