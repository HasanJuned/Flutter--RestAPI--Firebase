import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:softbyhasan/ui/getx_controllers/auth_controller.dart';
import 'package:softbyhasan/ui/screens/main-bottom-navbar.dart';
import 'package:softbyhasan/ui/screens/sign-up-screen.dart';
import 'package:softbyhasan/ui/screens/verify-with-email.dart';
import 'package:softbyhasan/ui/widgets/app-text-button.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../utils/text-styles.dart';
import '../widgets/app-elevated-button.dart';
import '../widgets/app-text-form-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //final AuthController authController = Get.put(AuthController()); /// main class ey StoreBinding kore felley bar bar put korte hobe na

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started With',
                style: screenTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              AppTextFormFieldWidget(
                hintText: 'Email',
                controller: emailTextController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextFormFieldWidget(
                obscureText: true,
                hintText: 'Password',
                controller: passwordTextController,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your valid password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<AuthController>(builder: (authController) {
                if (authController.loginInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return AppElevatedButton(
                  child: const Icon(Icons.arrow_forward_ios),
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      final bool result = await authController.login(
                          emailTextController.text.trim(),
                          passwordTextController.text);
                      if (result) {
                        Get.offAll(const MainBottomNavBar());
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Login failed. Try again!',
                        ));
                      }
                    }
                  },
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {
                    Get.to(const VerifyWithEmail());
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              AppTextButton(
                text1: "Don't Have an Account?",
                text2: 'Sign up',
                ontap: () {
                  Get.to(const SignUpScreen());
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
