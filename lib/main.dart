import 'package:ecommerce_concept/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_bloc.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_bloc.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_concept/locator_service.dart' as di;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/platform/local_notification_service.dart';
import 'features/cart/presentation/CartPage.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/product_details/presentation/bloc/product_bloc.dart';
import 'features/product_details/presentation/product_details_screen.dart';
import 'locator_service.dart ';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  LocalNotificationService.initialize();

  runApp(MyApp(initialLink));
}

FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

class MyApp extends StatelessWidget {
  final PendingDynamicLinkData? initialLink;

  MyApp(this.initialLink);

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
        //supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          Locale local = const Locale('en');
          if (locale != null && locale.languageCode == 'ru') {
            return locale;
          } else {
            return local;
          }
        },
        initialRoute: "/",
        routes: {
          "/product": (BuildContext context) => ProductDetailsScreen(),
          "/cart": (BuildContext context) => CartPage(),
          "/home": (BuildContext context) => HomeScreen(),
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

    final initialLink =
        context.findAncestorWidgetOfExactType<MyApp>()?.initialLink;
// Deeplink ?????????? ???????????????????? ??????????????
    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
      //using the dynamic link to push the user to a different screen
      Navigator.of(context).pushNamed(deepLink.path);
    }
// Deeplink ?????????? ???????????????????? ????????????????
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      Navigator.of(context).pushNamed(dynamicLinkData.link.path);
    }).onError((error) {
      // Handle errors
    });

    // ?????????? notification ?????????? ???????????????????? ??????????????
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

// ?????????? notification ?????????? ???????????????????? ?????????????? ?? ??????????????
    FirebaseMessaging.onMessage.listen((message) {
        LocalNotificationService.display(message);

    });

// ?????????? notification ?????????? ???????????????????? ?????????????? ?? ????????????????
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
