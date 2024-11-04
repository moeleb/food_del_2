import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_blocs.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_events.dart';
import 'package:food_delievery/pages/sign_in/bloc/signin_states.dart';
import 'package:food_delievery/pages/sign_in/sign_in_controller.dart';
import 'package:food_delievery/pages/sign_in/widgets/sign_in_widget.dart';
import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("login"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText("Or use your email account login")),
                  Container(
                    margin: EdgeInsets.only(top: 66.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Email"),
                        const SizedBox(height: 5),
                        buildTextField("Enter your Email", "email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        const SizedBox(height: 5),
                        buildTextField(
                            "Enter your password", "password", "lock",
                            (String value) {
                          context.read<SignInBloc>().add(PasswordEvent(value));
                        }),
                        forgetPassword(),
                        buildLoginAndRegButton("Login", "login", () {
                          SignInController(context: context)
                              .handleSignIn("email");
                        }),
                        SizedBox(
                          height: 25.h,
                        ),
                        buildLoginAndRegButton("Register", "register", () {
                          Navigator.pushNamed(context, "register");
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
