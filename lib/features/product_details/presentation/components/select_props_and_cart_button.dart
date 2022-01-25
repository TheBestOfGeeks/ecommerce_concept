

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelextPropsAndCartButton extends StatelessWidget {

  List<String> productColors;

  SelextPropsAndCartButton({required this.productColors});



  @override
  Widget build(BuildContext context) {

    String colorOne = productColors.elementAt(0);

    colorOne.replaceAllMapped(from, (match) => null)

    print(colorOne);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select color and capacity', style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Container(child: Image(image: AssetImage('assets/icons/product_details_page/check_mark.png'),), color: Color(0xff772D03),)),
            ],
          )
        ],
      ),
    );
  }
  
}