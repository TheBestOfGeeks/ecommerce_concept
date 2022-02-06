import 'dart:ui';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_details/presentation/bloc/product_bloc.dart';
import '../../../product_details/presentation/bloc/product_event.dart';

class BestSeller extends StatelessWidget {
  List<BestSellerEntity> bestseller;

  BestSeller(this.bestseller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Seller',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'see more',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  )),
            ],
          ),
          SizedBox(
            height: 500,
            child: GridView.count(
              physics:
                  BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              padding: const EdgeInsets.all(5),
              childAspectRatio: 0.8,
              children: bestseller.map((product) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: bestSaleItem(product, context),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bestSaleItem(BestSellerEntity itemProduct, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (itemProduct.id == 3333) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ProductDetailsScreen(),
          ),
        );
      }
    },
    child: Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image(
                  image: Image.memory(itemProduct.localPicture).image,
                  height: 150),
              itemProduct.isFavorite
                  ? Container(
                      child: const Image(
                        image: AssetImage(
                            'assets/icons/home_page/best_seller_icons/is_favorite.png'),
                        height: 15,
                      ),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ))
                  : Container(
                      child: Image(
                        image: AssetImage(
                            'assets/icons/home_page/best_seller_icons/is_favorite_empty.png'),
                        height: 15,
                      ),
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('\$${itemProduct.price_without_discount}  ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                  Text(
                    '\$${itemProduct.discount_price}  ',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${itemProduct.title}',
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
