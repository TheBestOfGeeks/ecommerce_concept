
import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';
import '../repository/home_repository.dart';

class GetDocuments extends Usecase<List<HomeEntity>, HomeParams>  {

  final HomeRepository homeRepository;

  GetDocuments({required this.homeRepository});

  @override
  Future <Either<Failure, List<HomeEntity>>> call (HomeParams params) async {
    return await homeRepository.getAllDocuments(params.path);
  }

}

class HomeParams extends Equatable {

  final String path;

  HomeParams({required this.path});


  @override
  List<Object?> get props => [path];

}