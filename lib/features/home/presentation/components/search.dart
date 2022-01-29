import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: const SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 10),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.deepOrangeAccent,
                    size: 20,
                  ),
                  //suffixIcon: Icon(Icons.search, color: Colors.deepOrangeAccent, size: 20,),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white, width: 4),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                    child: Image(
                      image:
                          AssetImage('assets/icons/home_page/group_icon.png'),
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
