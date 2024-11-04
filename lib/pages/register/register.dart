import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delievery/pages/register/bloc/register_blocs.dart';
import 'package:food_delievery/pages/register/bloc/register_events.dart';
import 'package:food_delievery/pages/register/bloc/register_states.dart';
import 'package:food_delievery/pages/register/register_controller.dart';

import '../common_widgets.dart';
import '../sign_in/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("register"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: reusableText(
                          "Enter your details below and free signup"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Username"),
                          buildTextField("Enter your username", "name", "user",
                              (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText("Email"),
                          const SizedBox(height: 5),
                          buildTextField("Enter your Email", "email", "user",
                              (String value) {
                            context
                                .read<RegisterBlocs>()
                                .add(EmailEvent(value));
                          }),
                          reusableText("Password"),
                          const SizedBox(height: 5),
                          buildTextField(
                              "Enter your password", "password", "lock",
                              (String value) {
                            context
                                .read<RegisterBlocs>()
                                .add(PasswordEvent(value));
                          }),
                          reusableText("Confirm password"),
                          const SizedBox(height: 5),
                          buildTextField(
                              "Confirm your password", "password", "lock",
                              (String value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RePasswordEvent(value));
                          }),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: reusableText(
                                "Enter your below details and signup"),
                          ),
                          buildLoginAndRegButton(
                            "Sign up",
                            "login",
                            () {
                              RegisterController(context : context).handleEmailRegister();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
