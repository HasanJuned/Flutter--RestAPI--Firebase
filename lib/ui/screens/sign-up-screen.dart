import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/loginScreen.dart';
import 'package:softbyhasan/ui/utils/text-styles.dart';
import 'package:softbyhasan/ui/widgets/app-elevated-button.dart';
import 'package:softbyhasan/ui/widgets/app-text-button.dart';
import 'package:softbyhasan/ui/widgets/app-text-form-field.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
              children: [
                const SizedBox(height: 32),
                Text('Join With Us', style: screenTitleTextStyle,),
                const SizedBox(height: 24),
                AppTextFormFieldWidget(
                    hintText: 'Email', controller: TextEditingController()),
                const SizedBox(height: 8),
                AppTextFormFieldWidget(
                    hintText: 'First Name', controller: TextEditingController()),
                const SizedBox(height: 8),
                AppTextFormFieldWidget(
                    hintText: 'Last Name', controller: TextEditingController()),
                const SizedBox(height: 8),
                AppTextFormFieldWidget(
                    hintText: 'Mobile', controller: TextEditingController()),
                const SizedBox(height: 8),
                AppTextFormFieldWidget(
                    hintText: 'Password', controller: TextEditingController()),
                const SizedBox(height: 24),
                AppElevatedButton(child: const Icon(Icons.arrow_forward_ios), ontap: (){}),
                const SizedBox(height: 16),
                AppTextButton(
                  text1: 'Have account?',
                  text2: 'Sign in',
                  ontap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  },
                )
              ],
            ),
            ),
          ),
        ),
      ),

    );
  }
}
