import 'package:equatable/equatable.dart';

abstract class CartItemsState extends Equatable {
  CartItemsState();

  @override
  List<Object?> get props => [];
}

class LoadingCartItemsState extends CartItemsState {}

class LoadedCartItemsState extends CartItemsState {
  final int items;

  LoadedCartItemsState({required this.items});

  @override
  List<Object?> get props => [items];
}

class ErrorCartItemsState extends CartItemsState {
  final String message;

  ErrorCartItemsState({required this.message});
}
