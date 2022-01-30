


import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/domain/repository/cart_products_repository.dart';

class GetCartItems {
  CartProductsRepository cartProductsRepository;

  GetCartItems({required this.cartProductsRepository});

  Future<Either<Failure, List<CartEntity>>> call() async {
    return await cartProductsRepository.getCartProducts();
  }
}
