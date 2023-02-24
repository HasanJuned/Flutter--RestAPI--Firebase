import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/otp-verification-screen.dart';
import 'package:softbyhasan/ui/utils/text-styles.dart';
import 'package:softbyhasan/ui/widgets/app-text-form-field.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../widgets/app-elevated-button.dart';
import '../widgets/app-text-button.dart';

class VerifyWithEmail extends StatefulWidget {
  const VerifyWithEmail({Key? key}) : super(key: key);

  @override
  State<VerifyWithEmail> createState() => _VerifyWithEmailState();
}

class _VerifyWithEmailState extends State<VerifyWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Email Address', style: screenTitleTextStyle,),
                  const SizedBox(height: 8),
                  Text('A 6 digits verification pin will be sent to your email address', style: screenSubTitleStyle),
                  const SizedBox(height: 24),
                  AppTextFormFieldWidget(
                      hintText: 'Email',
                      controller: TextEditingController()),
                  const SizedBox(height: 24,),
                  AppElevatedButton(
                    child: const Icon(Icons.arrow_forward_ios),
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const OtpVerificationScreen()));

                    },
                  ),
                  const SizedBox(height: 16,),
                  AppTextButton(
                    text1: "Have account?",
                    text2: 'Sign in',
                    ontap: (){
                      Navigator.pop(context);
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
