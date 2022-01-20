import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotSales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
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
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 170,
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
    Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/sale_one.png'),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Iphone 12',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Super.Mega.Rapido',
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Buy now!',
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/sale_one.png'),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/sale_one.png'),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
        ],
      ),
    ),
  ];
}
