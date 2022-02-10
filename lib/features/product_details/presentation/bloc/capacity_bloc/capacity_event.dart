


import 'package:equatable/equatable.dart';

abstract class CapacityEvent extends Equatable {}


class ChoseCapacityEvent extends CapacityEvent {

  final String capacity;

  ChoseCapacityEvent({required this.capacity});

  @override
  List<Object?> get props => [capacity];
}
