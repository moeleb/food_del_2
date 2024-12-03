import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/name.dart';
import '../../../../common/values/constant.dart';
import '../../../../global.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Container(
        child: const Text("Settings"),
      ),
    ),
  );
}

Widget settingsButton(context) {
  return GestureDetector(
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
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
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
  );
}
