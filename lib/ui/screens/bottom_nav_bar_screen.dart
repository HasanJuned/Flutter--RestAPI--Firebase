import 'package:flutter/material.dart';

import '../state_managers/bottom_navigationBar_controller.dart';
import '../utils/app_colors.dart';
import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'wish_list_screen.dart';
import 'package:get/get.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
          builder: (controller) {
            return _screens[controller.selectedIndex];
          }
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: softGreyColor.withOpacity(0.7),
            showUnselectedLabels: true,
            onTap: (value) {
              controller.changeIndex(value);
            },
            elevation: 8,
            currentIndex: controller.selectedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Wish'),
            ],
          );
        }
      ),
    );
  }
}
