import 'package:equatable/equatable.dart';
import 'package:travel_app_practice/models/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  //every cubit app should have an initial state. We pass a function, when we do that we trigger a new state that is called the Welcome State i.r after Initialization
  @override
  List<Object?> get props =>
      []; //we can pass the list of variables which will trigger the rebuilds.

}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends CubitStates {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends CubitStates {
  //triggered after data has been loaded.
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object?> get props => [places];
}

class DetailState extends CubitStates { //this is when we want to click on image and goto details state.
  //triggered after data has been loaded.
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object?> get props => [place];
}

