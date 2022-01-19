import 'package:flutter/material.dart';

import 'features/home/presentation/home_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home: HomeScreen(),
  theme: ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(229,229,229, 1.0),
  ),
);
  }

}





