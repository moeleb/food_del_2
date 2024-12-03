import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delievery/common/routes/name.dart';
import 'package:food_delievery/common/values/color.dart';
import 'package:food_delievery/common/values/constant.dart';
import 'package:food_delievery/global.dart';
import 'package:food_delievery/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:food_delievery/pages/profile/settings/bloc/settings_states.dart';
import 'package:food_delievery/pages/profile/settings/widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingStates>(
            builder: (context, state) {
          return Container(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirm Logout"),
                            content: Text("Confirm Logout"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Global.storageService.remove(
                                      AppConstants.STORAGE_USER_TOKEN_KEY);
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.SIGN_IN, (route) => false);
                                },
                                child: Text("Confirm"),
                              ),
                            ],
                          );
                        });
                  },
                  child: Container(
                    height: 100.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/icons/Logout.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
