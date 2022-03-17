

import 'package:ecommerce_concept/features/product_details/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/image_constants.dart';


class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final product = PassProductInherit.of(context)!.productEntity;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon:  Image(
                height: 28,
                width: 28,
                image: AssetImage(
                    Constants.PROCESSOR),
              ),
              onPressed: () {},
            ),
            Text(
              product.cpu,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Image(
                height: 28,
                width: 28,
                image: AssetImage(
                    Constants.CAMERA),
              ),
              onPressed: () {},
            ),
            Text(
              product.camera,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Image(
                height: 28,
                width: 28,
                image: AssetImage(
                    Constants.MEMORY),
              ),
              onPressed: () {},
            ),
            Text(
              product.ssd,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              icon: const Image(
                height: 28,
                width: 28,
                image: AssetImage(
                    Constants.STORAGE),
              ),
              onPressed: () {},
            ),
            Text(
              product.sd,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }

}

