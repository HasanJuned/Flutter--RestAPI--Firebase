import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigationBar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/home_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/new_product_by_remark_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/popular_product_by_remark_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/product_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/special_product_by_remark_controller.dart';


import 'ui/screens/splash_screen.dart';
import 'ui/state_managers/auth_controller.dart';
import 'ui/state_managers/category_controller.dart';
import 'ui/state_managers/user_auth_controller.dart';
import 'ui/state_managers/user_profile_controller.dart';
import 'ui/state_managers/wish_list_controller.dart';
import 'ui/utils/app_colors.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBindings(),
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
          elevation: 1,
          titleTextStyle: TextStyle(
            color: greyColor,
            fontSize: 18,
            fontWeight: FontWeight.w600
          )
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

class GetXBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(AuthController());
    Get.put(UserProfileController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(PopularProductByRemarkController());
    Get.put(NewProductByRemarkController());
    Get.put(SpecialProductByRemarkController());
    Get.put(ProductController());
    Get.put(WishListController());
    //Get.lazyPut(() => BottomNavigationBarController());
  }
  
}
