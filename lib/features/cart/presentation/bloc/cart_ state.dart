import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class InitialCartState extends CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<CartEntity> cartProducts;

  const LoadedCartState({required this.cartProducts});

  @override
  List<Object?> get props => [cartProducts];
}

class ErrorCartState extends CartState {
 final String errorMessage;

  ErrorCartState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
