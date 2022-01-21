
import 'dart:ui';
import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
          physics: BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          padding: const EdgeInsets.all(5),
          childAspectRatio: 0.8,
          children: bestseller.map((product) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: bestSaleItem(product),);
          }).toList(),
        ),
      ),
    ],
  ),
);
  }

}


 Widget bestSaleItem(BestSellerEntity itemProduct) {
  return   Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
      children: [
        Image(image: Image.network('${itemProduct.picture}').image,),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text('\$${itemProduct.price_without_discount}  '),
                Text('\$${itemProduct.discount_price}  ', style: TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough),),
              ],
            ),
            SizedBox(height: 5,),
            Text('${itemProduct.title}', style: TextStyle(fontSize: 10),),
            SizedBox(height: 5,),
          ],
        ),
      ],
    ),
  );
 }





