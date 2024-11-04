import 'package:bloc/bloc.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_events.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    print("My email is: ${event.email}");
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    print("My password is: ${event.password}");

    emit(state.copyWith(password: event.password));
  }
}
