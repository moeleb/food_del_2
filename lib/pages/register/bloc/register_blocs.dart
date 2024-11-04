import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_delievery/pages/register/bloc/register_events.dart';
import 'package:food_delievery/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_usernameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _usernameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    print(event.username);
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    print(event.email);

    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.password);

    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.rePassword);

    emit(state.copyWith(rePassword: event.rePassword));
  }
}
