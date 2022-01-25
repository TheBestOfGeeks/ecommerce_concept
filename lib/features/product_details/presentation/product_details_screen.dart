import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/product_state.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/header_and_image.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/name_and_stars.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/select_props_and_cart_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductBloc>().state;


    context.read<ProductBloc>().productId = 'dfsdg';


    if (state is LoadedProductState) {
       ProductEntity product = state.product.first;
      return _loadedProductScreen(product);
    } else if (state is ErrorProductState) {
      return Center(child: Text(state.errorMessage));
    }  else {
      return _loadingIndicator();
    }

  }
}

Widget _loadedProductScreen(ProductEntity product) {

  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            HeaderAndImage(productImages: product.images),
            SizedBox(
              height: 10,
            ),
            NameAndStars(product: product),
            SizedBox(
              height: 20,
            ),
            Properties(product: product),
            SizedBox(
              height: 20,
            ),
            SelextPropsAndCartButton(productColors: product.color),
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
