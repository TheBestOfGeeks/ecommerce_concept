import 'dart:typed_data';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderAndImage extends StatelessWidget {
  final List<Uint8List> productImages;

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
                        Constants.BACK),
                  ),
                  iconSize: 65),
               Text(AppLocalizations.of(context)!.product_details,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                  padding: EdgeInsets.only(right: 35),
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  icon: const Image(
                    image: AssetImage(
                        Constants.BUCKET_BUTTON),
                  ),
                  iconSize: 40),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(

              aspectRatio: 1.1,
              enlargeCenterPage: true,
              disableCenter: true,
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
