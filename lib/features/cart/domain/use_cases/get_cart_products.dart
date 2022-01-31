import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/cart/data/models/CartModel.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import '../repository/cart_products_repository.dart';

class GetCartProducts {
  CartProductsRepository cartProductsRepository;

  GetCartProducts({required this.cartProductsRepository});

  Future<Either<Failure, List<CartEntity>>> call() async {
    return await cartProductsRepository.getCartProducts();
  }
}
