

import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/capacity_bloc/capacity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class CapacityBloc extends Bloc<CapacityEvent, CapacityState> {
  CapacityBloc() : super(NotChoseCapacityState(capacity: '')) {


    on<ChoseCapacityEvent>((event, emit) {
      if(state is NotChoseCapacityState) {
      emit(ChoseCapacityState(capacity:  event.capacity));
      } else {
        emit(NotChoseCapacityState(capacity: event.capacity));
      }
    });

  }
}


