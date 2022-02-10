import 'package:ecommerce_concept/features/home/presentation/components/filter_sheet.dart';
import 'package:ecommerce_concept/features/home/presentation/map_page/geolocation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeoAndFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _filterBottomSheet() {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return FilterSheet();
          });
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 50,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.deepOrangeAccent,
              ),
              TextButton(child: Text(AppLocalizations.of(context)!.address,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => GeolocationPage()));
                },),
              IconButton(
                icon: const Icon(Icons.arrow_drop_down_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => GeolocationPage()));
                },
              ),
            ],
          ),
          IconButton(
            onPressed: () => _filterBottomSheet(),
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
      ),
    );
  }
}
