


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/best_seller.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/geo_and_filter.dart';
import 'components/hot_sales.dart';
import 'components/search.dart';
import 'components/select_category.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

return Scaffold(
  body: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          GeoAndFilter(),
          SizedBox(height: 10,),
          SelectCategory(),
          SizedBox(height: 25,),
          Search(),
          SizedBox(height: 10,),
          HotSales(),
          SizedBox(height: 10,),
          BestSeller(),
        ],
      ),
    ),
  ),
  bottomNavigationBar: BottomNavigationBarr(),
);
  }

}






/*
ClipRRect(
borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30) ),
child: NavigationBarTheme(
data: NavigationBarThemeData(
),
child: NavigationBar(
backgroundColor: Color.fromRGBO(1,0,53, 1),
destinations: [
NavigationDestination(icon: Icon(Icons.filter_alt_outlined, color: Colors.white), label: 'lklk'),
NavigationDestination(icon: Icon(Icons.filter_alt_outlined, color: Colors.white), label: 'lklk'),
NavigationDestination(icon: Icon(Icons.filter_alt_outlined, color: Colors.white), label: 'lklk'),
NavigationDestination(icon: Icon(Icons.filter_alt_outlined, color: Colors.white), label: 'lklk'),
],
),
),
)*/
