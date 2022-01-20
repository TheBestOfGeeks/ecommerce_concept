

import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEntity extends Equatable {

  final int id;
  final List<BestSellerEntity> best_seller_path;
  final List<HotSalesEntity> hot_sales_path;

  HomeEntity({required this.id, required this.best_seller_path, required this.hot_sales_path});

  @override
  List<Object?> get props => [id, best_seller_path, hot_sales_path];
}