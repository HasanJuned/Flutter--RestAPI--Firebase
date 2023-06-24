import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../customer_module/customer_auth/customer_login_screen.dart';
import '../seller_module/seller_auth/seller_login_screen.dart';

class ChooseAuthScreen extends StatefulWidget {
  const ChooseAuthScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAuthScreen> createState() => _ChooseAuthScreenState();
}

class _ChooseAuthScreenState extends State<ChooseAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: [
        Image.asset(
          'assets/images/background.jpg',
          fit: BoxFit.cover,
          width: screenSize.width,
          height: screenSize.height,
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Login as',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.off(const CustomerLoginScreen());
                    },
                    child: const Text(
                      'Customer',
                      style: TextStyle(color: Colors.black, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.off(const SellerLoginScreen());
                    },
                    child: const Text(
                      'Seller',
                      style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
