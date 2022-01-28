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
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                item.title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                '\$${item.price.toDouble()}',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 30,
              color: Color.fromRGBO(40, 40, 67, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(
                          image: AssetImage('assets/icons/cart_page/minus.png'),
                          width: 15),
                    ),
                    width: 30,
                  ),
                  Text(
                    particularItemCount.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image(
                      image: AssetImage('assets/icons/cart_page/plus.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage('assets/icons/cart_page/delete.png'),
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
