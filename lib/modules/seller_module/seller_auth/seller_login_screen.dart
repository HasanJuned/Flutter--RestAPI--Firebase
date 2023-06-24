import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/seller_auth/seller_registration_screen.dart';

import '../screens_seller/seller_home_screen.dart';

class SellerLoginScreen extends StatefulWidget {
  const SellerLoginScreen({Key? key}) : super(key: key);

  @override
  State<SellerLoginScreen> createState() => _SellerLoginScreenState();
}

class _SellerLoginScreenState extends State<SellerLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool inProgress = false;

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    Get.off(const SellerHomeScreen());
    Get.showSnackbar(const GetSnackBar(
      title: 'Success Login',
      message: ' ',
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Seller Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        focusColor: Colors.white,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        focusColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              login();
                            }
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                          child: const Text('Next'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Don't have an account ?",
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAll(const SellerRegistrationScreen());
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18, color: Colors.greenAccent, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
