

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    ),
  ),
);
  }

}