import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/product_details/domain/use_cases/getProductDetails.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductDetails productDetails;
  String productId = '';

  ProductBloc({required this.productDetails}) : super(InitialProductState()) {
    on<LoadingProductEvent>((event, emit) async {
      final product = await productDetails.call(DetailParams(productId));

      emit(product.fold(
          (failure) =>
              ErrorProductState(errorMessage: _errorLoadingProduct(failure)),
          (product) => LoadedProductState(product: product)));
    });
  }

  String _errorLoadingProduct(error) {
    switch (error.runtimeType) {
      case ServerFailure:
        return 'Server Error';
      default:
        return 'Unexpected Error';
    }
  }
}
