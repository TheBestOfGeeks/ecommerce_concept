

import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_event.dart';
import 'package:ecommerce_concept/features/product_details/presentation/bloc/color_bloc/color_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(NotChoseColorState(color: '')) {

    on<ChoseColorEvent>((event, emit) {
      if(state is NotChoseColorState) {
        emit(ChoseColorsState(color: event.color));
      } else {
        emit(NotChoseColorState(color: event.color));
      }
    });

  }

}