import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/utils/app_colors.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellowAccent,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400, letterSpacing: 0.6),
          ),
        ),
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400, letterSpacing: 0.6),
          ),
        ),
      ),
    );
  }
}
