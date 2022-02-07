import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        builder: (BuildContext context, controller) {
          return Container(
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
                filters(context),
              ],
            ),
          );
        });
  }
}

Widget top(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      IconButton(
        padding: EdgeInsets.only(left: 44),
        iconSize: 32,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Image(
          image: AssetImage(Constants.BACK_BUTTON),
        ),
      ),
      Text(
        AppLocalizations.of(context)!.filter_options,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      Container(
        padding: EdgeInsets.only(right: 20),
        child: MaterialButton(
          onPressed: () {},
          color: Colors.deepOrangeAccent,
          child: Text(AppLocalizations.of(context)!.done, style: TextStyle(fontWeight: FontWeight.bold)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    ],
  );
}

Widget filters(BuildContext context) {
  List brand = ['Samsung', 'Iphone', 'Xiaomi'];
  List price = ['300-1000','1000-3000','3000-10000'];
  List size = ['4.7','5.5','6.7'];
  return Container(
    padding: const EdgeInsets.only(right: 31, left: 31),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          AppLocalizations.of(context)!.brand,
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
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(220,220,220, 1)),
              ),
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
         Text(
          AppLocalizations.of(context)!.price,
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
         Text(
          AppLocalizations.of(context)!.size,
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
    ),
  );
}
