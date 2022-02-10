import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  ProductState();

  List<Object?> get props => [];
}

class InitialProductState extends ProductState {}


class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<ProductEntity> product;

  LoadedProductState({required this.product});

  @override
  List<Object?> get props => [product];
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
