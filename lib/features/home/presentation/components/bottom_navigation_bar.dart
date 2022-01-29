import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/CartPage.dart';

class BottomNavigationBarr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarrState();
  }
}

class BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      child: BottomNavyBar(
          showElevation: false,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: _currentIndex,
          backgroundColor: Color.fromRGBO(1, 0, 53, 1),
          items: [
            BottomNavyBarItem(
                icon: Container(
                  child: Image(
                    image: AssetImage(
                        'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon1.png'),
                    height: 10,
                    width: 10,
                  ),
                ),
                title: Text('Explorer', style: TextStyle(color: Colors.white)),
                activeColor: Color.fromRGBO(1, 0, 53, 1),
                inactiveColor: Color.fromRGBO(1, 0, 53, 1)),
            BottomNavyBarItem(
              icon: Row(
                children: [
                  Image(
                    image: AssetImage(
                        'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon2.png'),
                    height: 15,
                    width: 15,
                  ),
                  Text('2',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ],
              ),
              title: Text('Cart'),
              activeColor: Colors.white,
            ),
            BottomNavyBarItem(
              icon: Image(
                image: AssetImage(
                    'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon3.png'),
                height: 15,
                width: 15,
              ),
              title: Text(''),
              activeColor: Color.fromRGBO(1, 0, 53, 1),
            ),
            BottomNavyBarItem(
              icon: Image(
                image: AssetImage(
                    'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon4.png'),
                height: 15,
                width: 15,
              ),
              title: Text(''),
              activeColor: Color.fromRGBO(1, 0, 53, 1),
            ),
          ],
          onItemSelected: (int value) {
            setState(() {
              _currentIndex = value;
            });
            if (value == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CartPage()));
            }
          }),
    );
  }
}
