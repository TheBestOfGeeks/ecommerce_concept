import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackAndAdressButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Image(
                    image: AssetImage(
                        'assets/icons/product_details_page/back_button.png'),
                  ),
                  iconSize: 67),
              Row(
                children: [
                  const Text('Add address',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/icons/cart_page/address.png'),
                      ),
                      iconSize: 50),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'My Cart',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent[800]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
