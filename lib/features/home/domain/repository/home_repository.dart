import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HomeEntity>>> getAllDocuments(String path);
}
