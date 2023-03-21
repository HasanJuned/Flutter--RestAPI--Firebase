import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/SplashScreen.dart';
import 'package:get/get.dart';
import 'package:softbyhasan/ui/screens/loginScreen.dart';
import 'package:softbyhasan/ui/screens/main-bottom-navbar.dart';
import 'package:softbyhasan/ui/screens/otp-verification-screen.dart';
import 'package:softbyhasan/ui/screens/sign-up-screen.dart';
import 'package:softbyhasan/ui/screens/verify-with-email.dart';

main(){
  runApp(const TaskManager());
}

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: TaskManager.globalKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // getPages: [
      //   GetPage(name: '/', page: () => const SplashScreen()),
      //   GetPage(name: '/Login Screen', page: ()=> const LoginScreen()),
      //   GetPage(name: '/Sign Up Screen', page: ()=> const SignUpScreen()),
      //   GetPage(name: '/Verify Email', page: ()=> const VerifyWithEmail()),
      //   GetPage(name: '/Main Bottom NavBar', page: ()=> const MainBottomNavBar()),
      // ],
    );
  }
}
