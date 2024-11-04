import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delievery/common/widgets/flutter_toast.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_blocs.dart';
import 'package:food_delievery/pages/welcome/welcome.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  // type for social or whatever
  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill an email Address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill the password");
          return;
        }
        try {
          final credentials =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credentials.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credentials.user!.emailVerified) {
            toastInfo(msg: "You need to verify you email Account");
            return;
          }
          var user = credentials.user;
          if (user != null) {
            /// we have user
            print("we have a user");
            Navigator.pushNamed(context, "application");
          } else {
            toastInfo(msg: "Currently you are not a user for this app");
            return;

            /// error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "User not found for the email");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong Password");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Email format is wrong");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
