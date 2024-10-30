import 'package:flutter/material.dart';
import 'package:food_delievery/controllers/tab_index_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            Container(
              height: height,
              width: width,
              color: kPrimary,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: kPrimary,
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.black38),
                  selectedIconTheme: const IconThemeData(color: kSecondary),
                  currentIndex: controller.tabIndex,
                  onTap: (int value) {
                    controller.setTabIndex = value;
                    print(value);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: controller.tabIndex == 0
                            ? const Icon(AntDesign.appstore1)
                            : const Icon(AntDesign.appstore_o),
                        label: 'Home'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.search), label: 'Search'),
                    const BottomNavigationBarItem(
                        icon: Badge(
                            label: Text("1"),
                            child: Icon(FontAwesome.opencart)),
                        label: 'Cart'),
                    BottomNavigationBarItem(
                        icon: controller.tabIndex == 3
                            ? const Icon(FontAwesome.user_circle)
                            : const Icon(FontAwesome.user_circle_o),
                        label: 'Profile'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
