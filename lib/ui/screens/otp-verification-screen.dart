import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:softbyhasan/ui/screens/loginScreen.dart';
import 'package:softbyhasan/ui/screens/reset-password-screen.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../utils/text-styles.dart';
import '../widgets/app-elevated-button.dart';
import '../widgets/app-text-button.dart';
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
                  Text('Pin Verification', style: screenTitleTextStyle,),
                  const SizedBox(height: 8),
                  Text('A 6 digits verification pin will be sent to your email address', style: screenSubTitleStyle),
                  const SizedBox(height: 24),

                  PinCodeTextField(
                    length: 5,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.green
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    }, appContext: context,
                  ),
                  const SizedBox(height: 24,),
                  AppElevatedButton(
                    child: const Text('Verify'),
                    ontap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen()));
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
