



import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {

  ProductEvent();

  @override
  List<Object?> get props => [];
}


class LoadingProductEvent extends ProductEvent {


  @override
  List<Object?> get props => [];
}