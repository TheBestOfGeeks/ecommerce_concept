import 'package:equatable/equatable.dart';

abstract class ColorState extends Equatable {
  final String color;

  ColorState({required this.color});

  @override
  List<Object?> get props => [color];
}

class ChoseColorsState extends ColorState {
  ChoseColorsState({required String color}) : super(color: color);

  @override
  List<Object?> get props => [];
}

class NotChoseColorState extends ColorState {
  NotChoseColorState({required String color}) : super(color: color);

  @override
  List<Object?> get props => [];
}
