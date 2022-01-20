
import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:equatable/equatable.dart';
import '../repository/home_repository.dart';

class GetBestSellerDocuments extends Usecase<List<BestSellerEntity>, HomeParams>  {

  final HomeRepository homeRepository;

  GetBestSellerDocuments(this.homeRepository);

  @override
  Future <Either<Failure, List<BestSellerEntity>>> call (HomeParams params) async {
    return await homeRepository.getBestSellerDocuments(params.path);
  }

}

class HomeParams extends Equatable {

  final String path;

  HomeParams({required this.path});


  @override
  List<Object?> get props => [path];

}