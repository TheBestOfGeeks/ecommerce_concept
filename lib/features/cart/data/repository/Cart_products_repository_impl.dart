import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/cart/data/data_sourses/cart_remote_data_sourse.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/domain/repository/cart_products_repository.dart';

class CartProductsRepositoryImpl implements CartProductsRepository {
  CartRemoteDataSource cartRemoteDataSource;
  NetworkInfo networkInfo;

  CartProductsRepositoryImpl(
      {required this.cartRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<CartEntity>>> getCartProducts() async {
    if (await networkInfo.isConnected) {
      final cartDocuments = await cartRemoteDataSource.getCartDocument();

      return Right(cartDocuments);
    } else {
      return Left(ServerFailure());
    }
  }
}
