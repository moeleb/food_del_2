import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
                  BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
