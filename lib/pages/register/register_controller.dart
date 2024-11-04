import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delievery/common/widgets/flutter_toast.dart';
import 'package:food_delievery/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if (username.isEmpty) {
      toastInfo(msg: "UserName cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "rePassword cannot be empty");
      return;
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user!.sendEmailVerification();
        await credential.user!.updateDisplayName(username);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it please check your, and click on the link to activate it");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The Password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "Email Already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Ivalid Email");
      }
    }
  }
}
