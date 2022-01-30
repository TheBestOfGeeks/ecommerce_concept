import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        builder: (BuildContext context, controller) {
          return Container(
            padding: const EdgeInsets.only(right: 40, left: 40),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                top(context),
                const SizedBox(
                  height: 50,
                ),
                filters(),
              ],
            ),
          );
        });
  }
}

Widget top(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Image(
          image: AssetImage('assets/icons/home_page/back_button.png'),
          height: 30,
        ),
      ),
      const Text(
        'Filter options',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      MaterialButton(
        onPressed: () {},
        color: Colors.deepOrangeAccent,
        child: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ],
  );
}

Widget filters() {
  List brand = ['Samsung', 'Iphone', 'Xiaomi'];
  List price = ['300-1000','1000-3000','3000-10000'];
  List size = ['4.7','5.5','6.7'];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Brand',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 15, top: 5),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonFormField(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              isCollapsed: true),
          iconSize: 20,
          isExpanded: true,
          items: brand.map((b) {
            return DropdownMenuItem(
                value: b,
                child: Text(
                  '$b',
                  style: const TextStyle(fontSize: 15),
                ));
          }).toList(),
          onChanged: (v) {},
        ),
      ),
      const Text(
        'Price',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 15, top: 5),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonFormField(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              isCollapsed: true),
          iconSize: 20,
          isExpanded: true,
          items: price.map((b) {
            return DropdownMenuItem(
                value: b,
                child: Text(
                  '$b\$',
                  style: const TextStyle(fontSize: 15),
                ));
          }).toList(),
          onChanged: (v) {},
        ),
      ),
      const Text(
        'Size',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 15, top: 5),
        height: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: DropdownButtonFormField(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              isCollapsed: true),
          iconSize: 20,
          isExpanded: true,
          items: size.map((b) {
            return DropdownMenuItem(
                value: b,
                child: Text(
                  '$b',
                  style: const TextStyle(fontSize: 15),
                ));
          }).toList(),
          onChanged: (v) {},
        ),
      ),
    ],
  );
}
