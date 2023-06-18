import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/choose_auth_screen.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/teacher_login_screen.dart';
import 'package:ostad_flutter_batch_two/screens/teacher_home_page_screen.dart';

import 'sign_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      return Get.to(const ChooseAuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
                child: Image.asset('assets/images/logo.png', width: 100)
            ),
          ),

          Column(
            children: const [
              CircularProgressIndicator(
                color: Colors.green,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Version 1.0', style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    letterSpacing: 0.6
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}