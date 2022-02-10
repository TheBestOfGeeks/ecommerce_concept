import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_bloc.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_event.dart';
import 'package:ecommerce_concept/features/cart/presentation/bloc/get_cart_items_bloc/cart_items_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/CartPage.dart';

class BottomNavigationBarr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarrState();
  }
}

class BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(30), topRight: Radius.circular(30)),
      child: BlocBuilder<CartItemsBloc, CartItemsState>(
        builder: (context, state) {

          context.read<CartItemsBloc>().add(LoadingCartItemsEvent());

          if (state is LoadedCartItemsState) {
            return BottomNavyBar(
                showElevation: false,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                selectedIndex: _currentIndex,
                backgroundColor: const Color.fromRGBO(1, 0, 53, 1),
                items: [
                  BottomNavyBarItem(
                      icon: Container(
                        child: Row(
                          children: [
                            SizedBox(width: 24,),
                            Image(
                              image: AssetImage(
                                  'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon1.png'),
                              height: 10,
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      title: const Text('Explorer',
                          style: TextStyle(color: Colors.white)),
                      activeColor: const Color.fromRGBO(1, 0, 53, 1),
                      inactiveColor: const Color.fromRGBO(1, 0, 53, 1)),
                  BottomNavyBarItem(
                    icon: Row(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon2.png'),
                          height: 15,
                          width: 15,
                        ),
                        Text(state.items.toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ],
                    ),
                    title: const Text('Cart'),
                    activeColor: Colors.white,
                  ),
                  BottomNavyBarItem(
                    icon: const Image(
                      image: const AssetImage(
                          'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon3.png'),
                      height: 15,
                      width: 15,
                    ),
                    title: const Text(''),
                    activeColor: const Color.fromRGBO(1, 0, 53, 1),
                  ),
                  BottomNavyBarItem(
                    icon: const Image(
                      image: const AssetImage(
                          'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon4.png'),
                      height: 15,
                      width: 15,
                    ),
                    title: const Text(''),
                    activeColor: const Color.fromRGBO(1, 0, 53, 1),
                  ),
                ],
                onItemSelected: (int value) {
                  setState(() {
                    _currentIndex = value;
                  });
                  if (value == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CartPage()));
                  }
                });
          }
          else {
            return BottomNavyBar(
                showElevation: false,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                selectedIndex: _currentIndex,
                backgroundColor: const Color.fromRGBO(1, 0, 53, 1),
                items: [
                  BottomNavyBarItem(
                      icon: Container(
                        child: const Image(
                          image: AssetImage(
                              'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon1.png'),
                          height: 10,
                          width: 10,
                        ),
                      ),
                      title: const Text('Explorer',
                          style: TextStyle(color: Colors.white)),
                      activeColor: const Color.fromRGBO(1, 0, 53, 1),
                      inactiveColor: const Color.fromRGBO(1, 0, 53, 1)),
                  BottomNavyBarItem(
                    icon: Row(
                      children: const [
                        Image(
                          image: AssetImage(
                              'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon2.png'),
                          height: 15,
                          width: 15,
                        ),
                        Text('',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),
                    title: const Text('Cart'),
                    activeColor: Colors.white,
                  ),
                  BottomNavyBarItem(
                    icon: const Image(
                      image: const AssetImage(
                          'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon3.png'),
                      height: 15,
                      width: 15,
                    ),
                    title: const Text(''),
                    activeColor: const Color.fromRGBO(1, 0, 53, 1),
                  ),
                  BottomNavyBarItem(
                    icon: const Image(
                      image: const AssetImage(
                          'assets/icons/home_page/bottom_navigation_bar_icons/bottom_icon4.png'),
                      height: 15,
                      width: 15,
                    ),
                    title: const Text(''),
                    activeColor: const Color.fromRGBO(1, 0, 53, 1),
                  ),
                ],
                onItemSelected: (int value) {
                  setState(() {
                    _currentIndex = value;
                  });
                  if (value == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => CartPage()));
                  }
                });
          }
        }
      ),
    );
  }
}
