import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_bloc.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_concept/locator_service.dart' as di;
import 'core/platform/local_notification_service.dart';
import 'features/cart/presentation/CartPage.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/product_details/presentation/product_details_screen.dart';
import 'locator_service.dart ';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await di.init();
  await Firebase.initializeApp();
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
        BlocProvider<CartItemsBloc>(create: (context) => sl<CartItemsBloc>()),
      ],
      child: MaterialApp(
        home: PageNavigation(),
        initialRoute: "/",
        routes: {
          "product_detail": (_) => ProductDetailsScreen(),
          "cart": (_) => CartPage(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
          fontFamily: 'MARKPRO',
        ),
      ),
    );
  }
}

class PageNavigation extends StatefulWidget {
  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

// Стрим notification когда приложение открыто и активно
    FirebaseMessaging.onMessage.listen((message) {
      if (message != null) {
        print(message.notification!.body);
        print(message.notification!.title);
      }

      LocalNotificationService.display(message);
    });

// Стрим notification когда приложение открыто и свёрнуто
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];
      Navigator.of(context).pushNamed(routeFromMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
