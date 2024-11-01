import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delievery/main.dart';
import 'package:food_delievery/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildThirdPartyLogin(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// We need context for bloc Accessing
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    child: Row(
      children: [
        GestureDetector(
          onTap:(){} ,
          child: SizedBox(
            width: 40.w,
            height: 40.w,
            child: Image.asset("assets/icons/google.png"),
          ),
        ),
      ],
    )
  );
}