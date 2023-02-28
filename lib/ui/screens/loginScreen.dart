import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Get Started With', style: screenTitleTextStyle,),
                const SizedBox(height: 24,),

                AppTextFormFieldWidget(
                  hintText: 'Email',
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 16,),
                AppTextFormFieldWidget(
                  obscureText: true,
                    hintText: 'Password',
                    controller: TextEditingController(),
                ),
                const SizedBox(height: 16,),

                AppElevatedButton(
                  child: const Icon(Icons.arrow_forward_ios),
                  ontap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (context) => const MainBottomNavBar()), (
                        route) => false);
                  },
                ),
                const SizedBox(height: 16,),
                Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const VerifyWithEmail()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),),
                ),
                AppTextButton(
                    text1: "Don't Have an Account?",
                    text2: 'Sign up',
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
                    },
                )
                

              ],
        ),
          )
      ),
    );
  }
}

