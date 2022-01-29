import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/cupertino.dart';

import '../../../product_details/presentation/components/cart_item.dart';

class CartAndCheck extends StatelessWidget {
  List<CartEntity> cartProducts;

  CartAndCheck({required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(1, 0, 53, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Container(
            height: 350,
            child: AnimationLimiter(
              child: GridView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text('${cartProducts.first.total}',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text('${cartProducts.first.delivery}',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              onPressed: () {},
              color: Colors.deepOrangeAccent,
              child: Text('Checkout',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
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
