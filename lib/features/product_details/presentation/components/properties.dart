import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:ecommerce_concept/features/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/properties_files/details.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/properties_files/features.dart';
import 'package:ecommerce_concept/features/product_details/presentation/components/properties_files/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Properties extends StatefulWidget {
  final ProductEntity product;

  Properties({Key? key, required this.product}) : super(key: key);

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  int choseProperty = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: 500,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () => setState(() => choseProperty = 1),
                      child: Text(
                        AppLocalizations.of(context)!.shop,
                        style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: choseProperty == 1 ?  Colors.black: Color.fromRGBO(0, 0, 0, 0.5),),
                      )),
                  choseProperty == 1 ?  Container(
                  width: 86,
                  height: 3,
                  color: Colors.deepOrange,
                  ): Container(),
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () => setState(() => choseProperty = 2),
                      child: Text(
                        AppLocalizations.of(context)!.details,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: choseProperty == 2 ?  Colors.black: Color.fromRGBO(0, 0, 0, 0.5),),
                      )),
                  choseProperty == 2 ?  Container(
                    width: 86,
                    height: 3,
                    color: Colors.deepOrange,
                  ): Container(),
                ],
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () => setState(() => choseProperty = 3),
                      child: Text(
                        AppLocalizations.of(context)!.features,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: choseProperty == 3 ?  Colors.black: Color.fromRGBO(0, 0, 0, 0.5),),
                      )),
                  choseProperty == 3 ?  Container(
                    width: 86,
                    height: 3,
                    color: Colors.deepOrange,
                  ): Container(),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          changeProperty(choseProperty),
        ],
      ),
    );
  }

  Widget changeProperty(int property) {
    switch (property) {
      case 1:
        return Shop();
      case 2:
        return Details();
      case 3:
        return Features();
      default:
        return Shop();
    }
  }
}
