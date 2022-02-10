

import 'package:equatable/equatable.dart';

abstract class ColorEvent extends Equatable {}


class ChoseColorEvent extends ColorEvent {

  final String color;

  ChoseColorEvent({required this.color});

  @override
  List<Object?> get props => [color];

}