import 'package:bloc/bloc.dart';
import 'package:food_delievery/pages/application/bloc/app_events.dart';
import 'package:food_delievery/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
