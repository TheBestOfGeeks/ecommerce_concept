

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeoAndFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      SizedBox(width: 50,),
      Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.deepOrangeAccent,),
          Text('Zihuatanejo, Gro'),
          IconButton(icon: Icon(Icons.arrow_drop_down_outlined), onPressed: () {},),
        ],
      ),
      IconButton(onPressed: () {} , icon: Icon(Icons.filter_alt_outlined),),
    ],
  ),
);
  }

}