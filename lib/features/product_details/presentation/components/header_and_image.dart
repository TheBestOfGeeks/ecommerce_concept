import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/features/cart/presentation/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderAndImage extends StatelessWidget {
  List<String> productImages;

  HeaderAndImage({required this.productImages});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Image(
                    image: AssetImage(
                        'assets/icons/product_details_page/back_button.png'),
                  ),
                  iconSize: 55),
              const Text('Product Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
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
                  iconSize: 30),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
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

Widget image(imageUrl) {
  return Image(
    image: Image.network(imageUrl).image,
    fit: BoxFit.fill,
  );
}
