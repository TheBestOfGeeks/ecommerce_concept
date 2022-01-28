import 'package:ecommerce_concept/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<HomeEntity> products;

  const HomeLoadedState({required this.products});

  @override
  List<Object?> get props => [products];
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
