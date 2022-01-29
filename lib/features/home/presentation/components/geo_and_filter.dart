import 'package:dartz/dartz.dart';
import 'package:ecommerce_concept/features/home/presentation/components/filter_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              const Text('Zihuatanejo, Gro'),
              IconButton(
                icon: Icon(Icons.arrow_drop_down_outlined),
                onPressed: () {},
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
