import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'cart_item.dart';

class CartAndCheck extends StatelessWidget {
  final List<CartEntity> cartProducts;

  CartAndCheck({required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 770,
      padding: const EdgeInsets.only(top: 80),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(1, 0, 53, 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 450,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: const AlwaysScrollableScrollPhysics()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3),
                  itemCount: cartProducts.first.basket.length,
                  itemBuilder: (context, index) {
                    return CartItem(itemIndex: index);
                  }),
            ),
          ),
          Container(
            width: 406,
            height: 2,
            color: const Color.fromRGBO(255, 255, 255, 0.25),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 55, right: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.total,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                Text('\$${cartProducts.first.total} us',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 12, left: 55, right: 55, bottom: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.delivery,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                Text(cartProducts.first.delivery,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          Container(
            width: 406,
            height: 2,
            color: const Color.fromRGBO(255, 255, 255, 0.25),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 27, bottom: 44, right: 44, left: 44),
            child: MaterialButton(
              minWidth: 326,
              height: 54,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              onPressed: () {},
              color: Colors.deepOrangeAccent,
              child: Text(AppLocalizations.of(context)!.checkout,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 20)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
