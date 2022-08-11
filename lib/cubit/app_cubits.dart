import 'package:bloc/bloc.dart';
import 'package:travel_app_practice/cubit/app_cubit_states.dart';
import 'package:travel_app_practice/models/data_model.dart';
import 'package:travel_app_practice/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(
      WelcomeState(),
    ); //after the initialization we trigger another state that is the welcome state.
  } //with this the initial state will be done.

  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(
          places)); //this will have been after loading, and passing the data to the cubit state
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
