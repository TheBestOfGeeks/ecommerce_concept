import 'package:ecommerce_concept/core/error/failure.dart';
import 'package:ecommerce_concept/features/home/domain/usecases/get_documents.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_event.dart';
import 'package:ecommerce_concept/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDocuments getDocuments;

  HomeBloc({required this.getDocuments}) : super(HomeInitialState()) {
    on<HomeLoadingEvent>((event, emit) async {
      final failureOrHome = await getDocuments.call(HomeParams(path: 'home'));
      emit(failureOrHome.fold(
          (failure) => HomeErrorState(message: _mapFailureToMessage(failure)),
          (products) => HomeLoadedState(products: products)));
    });

  }
}

String _mapFailureToMessage(failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Нет сединения с сервером, проверьте, пожалуйста, доступ в интернет';
    default:
      return 'Произошла непредвиденная ошибка, разработчики уведомлены';
  }
}
