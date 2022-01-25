import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectPropsAndCartButton extends StatefulWidget {
  ProductEntity product;

  SelectPropsAndCartButton({required this.product});

  @override
  State<SelectPropsAndCartButton> createState() =>
      _SelectPropsAndCartButtonState(
          product: product);
}

class _SelectPropsAndCartButtonState extends State<SelectPropsAndCartButton> {

  ProductEntity product;

  _SelectPropsAndCartButtonState(
      {required this.product});

  int? activeColorPicked;
  String? selectedCapacity;

  @override
  Widget build(BuildContext context) {

    List<String> productColors = product.color;
    List<String> productCapacity = product.capacity;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Select color and capacity',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => setState(() {
                  activeColorPicked = colorDecode(productColors.elementAt(0));
                }),
                icon: Container(
                  padding: EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(
                      colorDecode(productColors.elementAt(0)),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: activeColorPicked ==
                          colorDecode(productColors.elementAt(0))
                      ? const Image(
                          image: AssetImage(
                              'assets/icons/product_details_page/check_mark.png'),
                        )
                      : Container(),
                ),
              ),
              IconButton(
                onPressed: () => setState(() {
                  activeColorPicked = colorDecode(productColors.elementAt(1));
                }),
                icon: Container(
                  padding: EdgeInsets.all(8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(
                      colorDecode(productColors.elementAt(1)),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: activeColorPicked ==
                          colorDecode(productColors.elementAt(1))
                      ? const Image(
                          image: AssetImage(
                              'assets/icons/product_details_page/check_mark.png'),
                        )
                      : Container(),
                ),
              ),
              MaterialButton(
                onPressed: () => setState(() {
                  selectedCapacity = productCapacity.elementAt(0);
                }),
                color: selectedCapacity == productCapacity.elementAt(0) ? Colors.deepOrangeAccent: Color.fromRGBO(229,229,229, 1.0),
                child: Text('${productCapacity.elementAt(0)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: selectedCapacity == productCapacity.elementAt(0) ? Colors.white: Colors.grey)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              MaterialButton(
                onPressed: () => setState(() {
                  selectedCapacity = productCapacity.elementAt(1);
                }),
                color: selectedCapacity == productCapacity.elementAt(1) ? Colors.deepOrangeAccent: Color.fromRGBO(229,229,229, 1.0),
                child: Text('${productCapacity.elementAt(1)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: selectedCapacity == productCapacity.elementAt(1) ? Colors.white: Colors.grey)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
          SizedBox(height: 20,),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            onPressed: () {},
            color:  Colors.deepOrangeAccent,
            child: Text('Add to Cart   \$${product.price.toDouble()}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}

//Метод обрабатывает код цвета формата #772d03 в формат 0xFF772d03
int colorDecode(String colorCode) {
  int decode = int.parse('0xFF${colorCode.substring(1)}');
  return decode;
}
