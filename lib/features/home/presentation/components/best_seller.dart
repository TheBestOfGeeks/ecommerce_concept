


import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BestSeller extends StatelessWidget {
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
          children: _bestSales.map<Widget>((product) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: product,);
          }).toList(),
        ),
      ),
    ],
  ),
);
  }

}


List _bestSales = [
  Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
      children: [
        Image(image: AssetImage('assets/images/Samsung_product4.png'),),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text('\$1,047  '),
                Text('\$1,500  ', style: TextStyle(fontSize: 10, color: Colors.grey, decoration: TextDecoration.lineThrough),),
              ],
            ),
            SizedBox(height: 5,),
            Text('Samsung Galaxy s20 Ultra', style: TextStyle(fontSize: 10),),
            SizedBox(height: 5,),
          ],
        ),
      ],
    ),

  ),
  Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
      children: [
        Image(image: AssetImage('assets/images/Samsung_product1.png'))
      ],
    ),
  ),
  Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
      children: [
        Image(image: AssetImage('assets/images/Samsung_product2.png'))
      ],
    ),
  ),
  Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Stack(
      children: [
        Image(image: AssetImage('assets/images/Samsung_product3.png'))
      ],
    ),
  ),

];
