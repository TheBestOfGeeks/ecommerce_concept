

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';

abstract class CartProductsRepository {

  Future<Either<Failure, List<CartEntity>>> getCartProducts();
}