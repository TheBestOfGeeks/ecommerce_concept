

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce_concept/core/image_constants.dart';

class HotSales extends StatelessWidget {
  final List<HotSalesEntity> hotSales;

  HotSales(this.hotSales);

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
                 Text(
                  AppLocalizations.of(context)!.hot_sales,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                TextButton(
                    onPressed: () {},
                    child:  Text(
                      AppLocalizations.of(context)!.see_more,
                      style: const TextStyle(color: Colors.deepOrangeAccent),
                    )),
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.95,
              height: 200,
              autoPlayAnimationDuration: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.elasticInOut,
              disableCenter: true,
              pauseAutoPlayOnTouch: true,
            ),
            items: hotSales.map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: hotSaleItem(i, context),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget hotSaleItem(HotSalesEntity item, BuildContext context) {


    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: Image.memory(item.localPicture).image,
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item.isNew
                    ? Container(
                        child: const Image(
                          image: AssetImage(Constants.NEW_ICON),
                          height: 10,
                        ),
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(50),
                        ))
                    : Container(),
                Text(
                  item.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                item.id != 2
                    ? Text(
                        item.subtitle,
                        style: const TextStyle(color: Colors.white),
                      )
                    : const Text(''),
                MaterialButton(
                  height: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                  onPressed: () {},
                  child:  Text(
                    AppLocalizations.of(context)!.buy_now,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  hoverColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
