import 'package:bloc/bloc.dart';
import 'package:ecommerce_concept/features/cart/domain/use_cases/get_cart_products.dart';

import '../../../../core/error/failure.dart';
import 'cart_ event.dart';
import 'cart_ state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  GetCartProducts getCartProducts;

  CartBloc({required this.getCartProducts}) : super(InitialCartState()) {
    on<LoadingCartEvent>((event, emit) async {
      final failureOrCart = await getCartProducts.call();
      emit(
        failureOrCart.fold(
            (failure) => ErrorCartState(_mapFailureToMessage(failure)),
            (products) => LoadedCartState(cartProducts: products)),
      );
    });
  }

  String _mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error';
      default:
        return 'Unexpected Error';
    }
  }
}
