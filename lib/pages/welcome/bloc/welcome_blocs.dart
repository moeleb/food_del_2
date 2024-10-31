import 'package:bloc/bloc.dart';
import 'package:food_delievery/pages/welcome/bloc/welcome_events.dart';
import 'package:food_delievery/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBloc() : super(WelcomeStates()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeStates(page: state.page));
    });
  }
}
