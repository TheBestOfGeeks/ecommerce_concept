import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Properties extends StatelessWidget {
  ProductEntity product;

  Properties({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Shop',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Features',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Image(
                      image: AssetImage(
                          'assets/icons/product_details_page/processor.png'),
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    product.cpu,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )),
              Container(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Image(
                          image: AssetImage(
                              'assets/icons/product_details_page/camera.png'),
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        product.camera,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
              Container(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Image(
                          image: AssetImage(
                              'assets/icons/product_details_page/memory.png'),
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        product.ssd,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
              Container(
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Image(
                          image: AssetImage(
                              'assets/icons/product_details_page/storage.png'),
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        product.sd,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
