import 'package:bloc/bloc.dart';
import 'package:bloc_managment/models/product_model.dart';
import 'package:bloc_managment/services/api_services.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeLoadingData>((event, emit) async {
      emit(HomeLoading());
      try {
        final result = await ApiServices().getData();
        if (result != []) {
          emit(HomeSuccess(list: result));
        } else {
          emit(HomeError());
        }
      } catch (e) {
        emit(HomeError());
      }
    });
  }
}
