

import 'package:ecommerce_concept/features/home/domain/entities/best_seller_entity.dart';
import 'package:ecommerce_concept/features/home/domain/entities/hot_sales_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEntity extends Equatable {

  final String id;
  final List<HotSalesEntity> hot_sales_path;
  final List<BestSellerEntity> best_seller_path;

  HomeEntity({required this.id, required this.best_seller_path, required this.hot_sales_path});

  @override
  List<Object?> get props => [id, best_seller_path, hot_sales_path];
}