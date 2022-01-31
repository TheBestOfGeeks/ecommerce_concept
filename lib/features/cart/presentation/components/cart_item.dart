import 'package:ecommerce_concept/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_concept/features/cart/presentation/components/cart_and_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  int itemIndex;
  int particularItemCount = 1;

  CartItem({required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    Basket item = context
        .findAncestorWidgetOfExactType<CartAndCheck>()!
        .cartProducts
        .first
        .basket[itemIndex];

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Container(
              child: Image.network(
                item.images,
              ),
              width: 100,
              height: 100,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500,),
              ),
              Text(
                '\$${item.price.toDouble()}',
                style: const TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 30,
              color: const Color.fromRGBO(40, 40, 67, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          image: AssetImage('assets/icons/cart_page/minus.png'),
                          width: 15),
                    ),
                    width: 30,
                    height: 30,
                  ),
                  Text(
                    particularItemCount.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/icons/cart_page/plus.png'),

                      ),
                    ),
                    width: 30,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: const AssetImage('assets/icons/cart_page/delete.png'),
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
