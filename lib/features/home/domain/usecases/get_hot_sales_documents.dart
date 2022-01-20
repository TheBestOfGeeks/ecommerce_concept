

import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:ecommerce_concept/features/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';

class GetHotSalesDocuments extends Usecase<List<HotSalesEntity>, HomeParams>  {

  final HomeRepository homeRepository;

  GetHotSalesDocuments(this.homeRepository);

  @override
  Future <Either<Failure, List<HotSalesEntity>>> call (HomeParams params) async {
   return await homeRepository.getHotSalesDocuments(params.path);
  }

}

class HomeParams extends Equatable {

  final String path;

  HomeParams({required this.path});


  @override
  List<Object?> get props => [path];

}