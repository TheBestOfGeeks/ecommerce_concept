import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/features/cart/presentation/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAndImage extends StatelessWidget {
  List<Uint8List> productImages;

  HeaderAndImage({required this.productImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 42),
                  onPressed: () => Navigator.pop(context),
                  icon: const Image(
                    image: AssetImage(
                        'assets/icons/product_details_page/back_button.png'),
                  ),
                  iconSize: 65),
              const Text('Product Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                  padding: EdgeInsets.only(right: 35),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CartPage()));
                  },
                  icon: const Image(
                    image: AssetImage(
                        'assets/icons/product_details_page/bucket_button.png'),
                  ),
                  iconSize: 40),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(

              aspectRatio: 1.1,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.elasticInOut,
              disableCenter: true,
              pauseAutoPlayOnTouch: true,
            ),
            items: productImages.map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: image(i),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget image(image) {
  return Container(
    color: Colors.white,
    child: Image(
      image: Image.memory(image).image,
    ),
  );
}
