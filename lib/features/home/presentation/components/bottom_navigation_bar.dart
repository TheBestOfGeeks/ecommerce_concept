


import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarrState();
  }

}


class BottomNavigationBarrState extends State<BottomNavigationBarr> {

  int _curentIndex = 0;

  @override
  Widget build(BuildContext context) {
   return ClipRRect(
     borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30) ),
     child: BottomNavyBar(
       showElevation: false,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       selectedIndex: _curentIndex,
       backgroundColor: Color.fromRGBO(1,0,53, 1),
       items: [
         BottomNavyBarItem(icon: Image(image: AssetImage('assets/icons/bottom_navigation_bar_icons/bottom_icon1.png'),height: 10, width: 10,), title: Text('Explorer',style: TextStyle(color: Colors.white)),activeColor: Color.fromRGBO(1,0,53, 1), inactiveColor: Color.fromRGBO(1,0,53, 1) ),
         BottomNavyBarItem(icon: Image(image: AssetImage('assets/icons/bottom_navigation_bar_icons/bottom_icon2.png'),height: 15, width: 15,), title: Text(''),activeColor: Color.fromRGBO(1,0,53, 1),),
         BottomNavyBarItem(icon: Image(image: AssetImage('assets/icons/bottom_navigation_bar_icons/bottom_icon3.png'),height: 15, width: 15,), title: Text(''),activeColor: Color.fromRGBO(1,0,53, 1),),
         BottomNavyBarItem(icon: Image(image: AssetImage('assets/icons/bottom_navigation_bar_icons/bottom_icon4.png'),height: 15, width: 15,), title: Text(''),activeColor: Color.fromRGBO(1,0,53, 1),),
       ],
       onItemSelected: (int value) =>  setState(() {
         _curentIndex = value;
       }),
     ),
   );
  }

}