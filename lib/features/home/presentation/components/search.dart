import 'package:ecommerce_concept/core/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: 33,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: const TextStyle(fontSize: 10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.deepOrangeAccent,
                    size: 20,
                  ),
                  //suffixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent, size: 20,),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white, width: 4),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white, width: 4),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {},
                icon: Container(
                    child: const Image(
                      image: AssetImage(Constants.GROUP_ICON),
                      height: 15,
                    ),
                    alignment: Alignment.center,
                    width: 35,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(50),
                    ))),
          ),
        ],
      ),
    );
  }
}
