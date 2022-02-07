import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_bloc.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_state.dart';
import 'package:ecommerce_concept/features/home/presentation/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_event.dart';
import 'components/best_seller.dart';
import 'components/geo_and_filter.dart';
import 'components/hot_sales.dart';
import 'components/search.dart';
import 'components/select_category.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;

    List<HomeEntity> products = [];
    context.read<HomeBloc>().add(HomeLoadingEvent());

    if (state is HomeInitialState) {
      context.read<HomeBloc>().add(HomeLoadingEvent());
    } else if (state is HomeLoadedState) {
      products = state.products;
      return _HomeLoadedWidget(products);
    } else if (state is HomeErrorState) {
      return errorScreen(state.message);
    }
    return _loadingIndicator();
  }
}

Widget _HomeLoadedWidget(List<HomeEntity> products) {
  List<BestSellerEntity> _bestsellerProducts = products.first.best_seller_path;
  List<HotSalesEntity> _hotSalesProducts = products.first.hot_sales_path;

  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            GeoAndFilter(),
            const SizedBox(
              height: 10,
            ),
            const SelectCategory(),
            const SizedBox(
              height: 25,
            ),
            const Search(),
            const SizedBox(
              height: 10,
            ),
            HotSales(_hotSalesProducts),
            const SizedBox(
              height: 10,
            ),
            BestSeller(_bestsellerProducts),
          ],
        ),
      ),
    ),
    bottomNavigationBar: BottomNavigationBarr(),
  );
}

Widget _loadingIndicator() {
  return const Padding(
    padding: EdgeInsets.all(8),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget errorScreen(String errorMessage) {
  return Scaffold(
    body: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
