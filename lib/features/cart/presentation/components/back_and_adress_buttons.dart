
import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BackAndAdressButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Image(
                    image: AssetImage(
                        Constants.BACK),
                  ),
                  iconSize: 67),
              Row(
                children: [
                   Text(AppLocalizations.of(context)!.add_address,
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {},
                      icon: const Image(

                        image: AssetImage(Constants.ADDRESS),
                      ),
                      iconSize: 49),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.my_art,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueAccent[800]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
