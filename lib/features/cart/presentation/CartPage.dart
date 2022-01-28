import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_%20event.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/cart_entity.dart';
import 'bloc/cart_ state.dart';
import 'components/back_and_adress_buttons.dart';
import 'components/cart_and_check.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartEntity> products = [];
    final state = context.watch<CartBloc>().state;
    print(state);
    context.read<CartBloc>().add(LoadingCartEvent());

    if (state is LoadedCartState) {
      products = state.cartProducts;
      return _loadedCartScreen(products);
    } else if (state is ErrorCartState) {
      return Container(
        child: Center(
          child: Text(state.errorMessage),
        ),
      );
    }
    return _loadingIndicator();
  }
}

Widget _loadedCartScreen(List<CartEntity> products) {
  return Scaffold(
      body: SafeArea(
    child: SingleChildScrollView(
      physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          BackAndAdressButtons(),
          CartAndCheck(cartProducts: products),
        ],
      ),
    ),
  ));
}

Widget _loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
