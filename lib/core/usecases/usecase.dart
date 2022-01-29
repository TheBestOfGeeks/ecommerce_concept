import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
