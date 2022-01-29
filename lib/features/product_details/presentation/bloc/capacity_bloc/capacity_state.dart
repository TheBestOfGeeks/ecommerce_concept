import 'package:equatable/equatable.dart';

abstract class CapacityState extends Equatable {
  final String capacity;

  CapacityState({required this.capacity});

  @override
  List<Object?> get props => [capacity];
}

class ChoseCapacityState extends CapacityState {
  ChoseCapacityState({required String capacity}) : super(capacity: capacity);

  @override
  List<Object?> get props => [];
}

class NotChoseCapacityState extends CapacityState {
  NotChoseCapacityState({required String capacity}) : super(capacity: capacity);

  @override
  List<Object?> get props => [];
}
