import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/domain/use_cases/get_cart_items.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_event.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsBloc extends Bloc<CartItemsEvent, CartItemsState> {
  GetCartItems getCartItems;

  CartItemsBloc({required this.getCartItems}) : super(LoadingCartItemsState()) {
    on<LoadingCartItemsEvent>((event, emit) async {
      Either<Failure, List<CartEntity>> failureOrCartItems =
          await getCartItems.call();

      emit(failureOrCartItems.fold(
          (failure) =>
              ErrorCartItemsState(message: _mapFailureToMessage(failure)),
          (items) => LoadedCartItemsState(items: items.first.basket.length)));
    });
  }
}

String _mapFailureToMessage(failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Error';
    default:
      return 'Unexpected Error';
  }
}
