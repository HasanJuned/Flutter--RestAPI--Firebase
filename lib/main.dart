import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/getx_controllers/auth_controller.dart';
import 'package:softbyhasan/ui/screens/SplashScreen.dart';
import 'package:get/get.dart';

main() {
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
      initialBinding: StoreBindings(),
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

class StoreBindings extends Bindings {
  @override
  void dependencies() {
    /// Get.put(AuthController());
    Get.lazyPut(() => AuthController());
  }
}
