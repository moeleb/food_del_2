import 'package:bloc/bloc.dart';
import 'package:food_delievery/app_events.dart';
import 'package:food_delievery/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }

// register events
}
