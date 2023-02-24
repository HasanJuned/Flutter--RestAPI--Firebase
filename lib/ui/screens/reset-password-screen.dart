import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/app-text-form-field.dart';

import '../utils/text-styles.dart';
import '../widgets/app-elevated-button.dart';
import '../widgets/app-text-button.dart';
import '../widgets/screen-Background-images.dart';
import 'loginScreen.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Set Password', style: screenTitleTextStyle,),
                  const SizedBox(height: 8),
                  Text('Minimum length password 8 character with Letter & Number combination', style: screenSubTitleStyle),
                  const SizedBox(height: 24),
              AppTextFormFieldWidget(
                  hintText: 'Password', controller: TextEditingController()),
              const SizedBox(height: 16,),
              AppTextFormFieldWidget(
                  hintText: 'Confirm Password',
                  controller: TextEditingController()),
              const SizedBox(height: 24),
              AppElevatedButton(
                    child: const Text('Confirm'),
                    ontap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                              (route) => false);
                },
                  ),
                  const SizedBox(height: 16,),
                  AppTextButton(
                    text1: "Have account?",
                    text2: 'Sign in',
                    ontap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                              (route) => false);
                    },
                  )


                ],
              ),
            ),
          )
      ),

    );
  }
}
