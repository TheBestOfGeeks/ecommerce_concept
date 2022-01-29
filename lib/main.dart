import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_concept/locator_service.dart' as di;
import 'features/home/presentation/home_screen.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'locator_service.dart ';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => sl<HomeBloc>()),
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
        BlocProvider<CartBloc>(create: (context) => sl<CartBloc>()),
        BlocProvider<CapacityBloc>(create: (context) => CapacityBloc()),
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
          fontFamily: 'MARKPRO',
        ),
      ),
    );
  }
}
