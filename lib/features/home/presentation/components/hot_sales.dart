import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotSales extends StatelessWidget {
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
                'Hot sales',
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
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.elasticInOut,
              disableCenter: true,
              pauseAutoPlayOnTouch: true,
            ),
            items: _sales.map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: i,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }



  List _sales = [
    Stack(
      children: [
        Image(
          image: AssetImage('assets/images/sale_one.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Image(
                  image: AssetImage('assets/icons/new.png'),
                  height: 10,
                ),
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(50),
                )),
            Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Description',
              style: TextStyle(color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
    Stack(
      children: [
        Image(
          image: AssetImage('assets/images/sale_one.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Image(
                  image: AssetImage('assets/icons/new.png'),
                  height: 10,
                ),
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(50),
                )),
            Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Description',
              style: TextStyle(color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
    Stack(
      children: [
        Image(
          image: AssetImage('assets/images/sale_one.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Image(
                  image: AssetImage('assets/icons/new.png'),
                  height: 10,
                ),
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(50),
                )),
            Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Description',
              style: TextStyle(color: Colors.white),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                'Button',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}
