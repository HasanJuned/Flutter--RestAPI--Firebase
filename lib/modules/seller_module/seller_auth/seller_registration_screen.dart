import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/seller_auth/seller_information_screen.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/seller_auth/seller_login_screen.dart';

class SellerRegistrationScreen extends StatefulWidget {
  const SellerRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<SellerRegistrationScreen> createState() =>
      _SellerRegistrationScreenState();
}

class _SellerRegistrationScreenState extends State<SellerRegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool inProgress = false;

  Future register() async {
    inProgress = true;
    setState(() {

    });
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      setState(() {
        inProgress = false;
        Get.to(SellerInformationScreen(email: emailController.text.toString()));
      });
    }).onError((error, stackTrace) {
      Get.showSnackbar(const GetSnackBar(
        title: 'User Already Registered',
        message: 'Please try different account',
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ));
      setState(() {
        inProgress = false;
      });
    });
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
                      'Seller Registration',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          focusColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          focusColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.green))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              register();

                            }
                          },
                          child: const Text('Next')),
                    )
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
