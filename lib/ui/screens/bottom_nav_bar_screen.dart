import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'cart_screen.dart';
import 'categories_screen.dart';
import 'home_screen.dart';
import 'wish_list_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen()
  ];

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[selectedScreen],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: softGreyColor.withOpacity(0.7),
        showUnselectedLabels: true,
        onTap: (value) {
          selectedScreen = value;
          if(mounted){
            setState(() {});
          }

        },
        elevation: 8,
        currentIndex: selectedScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wish'),
        ],
      ),
    );
  }
}
