import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/core/usecases/usecase.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_concept/features/product_details/domain/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

class GetProductDetails extends Usecase<List<ProductEntity>, DetailParams> {
  ProductRepository productRepository;

  GetProductDetails({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(DetailParams params) async {
    return await productRepository.getProducts();
  }
}

class DetailParams extends Equatable {
  final String productId;

  DetailParams(this.productId);

  List<Object?> get props => [productId];
}
