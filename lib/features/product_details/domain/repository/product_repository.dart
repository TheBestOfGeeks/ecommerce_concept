


import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';

abstract class ProductRepository {

  Future <Either<Failure, List<ProductEntity>>> getProducts ();

}