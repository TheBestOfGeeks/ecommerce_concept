import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HotSales extends StatelessWidget {
  List<HotSalesEntity> hotSales;

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
                const Text(
                  'Hot sales',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
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
              height: 180,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.elasticInOut,
              disableCenter: true,
              pauseAutoPlayOnTouch: true,
            ),
            items: hotSales.map((i) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: hotSaleItem(i),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget hotSaleItem(HotSalesEntity item) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: Image.network(item.picture).image,
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
                          image: AssetImage('assets/icons/home_page/new.png'),
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
                  child: const Text(
                    'Buy now!',
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
