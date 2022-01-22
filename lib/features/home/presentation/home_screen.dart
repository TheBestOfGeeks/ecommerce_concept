


import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_event.dart';
import 'components/best_seller.dart';
import 'components/bottom_navigation_bar.dart';
import 'components/geo_and_filter.dart';
import 'components/hot_sales.dart';
import 'components/search.dart';
import 'components/select_category.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final state = context.watch<HomeBloc>().state;

    List<HomeEntity> products = [];

    print(state);

    context.read<HomeBloc>().add(HomeLoadingEvent());


if (state is HomeLoadingState) {
  return _loadingIndicator();
} else if (state is HomeLoadedState) {
  products = state.products;
  return _HomeLoadedWidget(products);
} else if (state is HomeErrorState) {
  return Center(child: Text(state.message));
} else {return Scaffold(body: Center(child: Text('Произошла непредвиденная ошибка, разработчики уведомлены')));}
  }

}


Widget _HomeLoadedWidget(List<HomeEntity> products) {

  List<BestSellerEntity> _bestsellerProducts = products.first.best_seller_path;
  List<HotSalesEntity> _hotSalesProducts = products.first.hot_sales_path;


  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: 10,),
            GeoAndFilter(),
            SizedBox(height: 10,),
            SelectCategory(),
            SizedBox(height: 25,),
            Search(),
            SizedBox(height: 10,),
            HotSales(_hotSalesProducts),
            SizedBox(height: 10,),
            BestSeller(_bestsellerProducts),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBarr(),
  );
}



Widget _loadingIndicator() {

  return Padding(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}