import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_state.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/header_and_image.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/name_and_stars.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/properties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/select_props_and_cart_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;

    if (state is InitialProductState) {
      context.read<ProductBloc>().add(LoadingProductEvent());
    } else if (state is LoadedProductState) {
      ProductEntity product = state.product.first;
      return _loadedProductScreen(product);
    } else if (state is ErrorProductState) {
      return Center(child: Text(state.errorMessage));
    }
    return _loadingIndicator();
  }
}

Widget _loadedProductScreen(ProductEntity product) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            HeaderAndImage(productImages: product.localImages),
            const SizedBox(
              height: 10,
            ),
            NameAndStars(product: product),
            Properties(product: product),
            SelectPropsAndCartButton(product: product),
          ],
        ),
      ),
    ),
  );
}

Widget _loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
