import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/widgets/screen-Background-images.dart';

import '../utils/text-styles.dart';
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
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Get Started With', style: screenTitleTextStyle,),
              ),
              const SizedBox(height: 24,),

              AppTextFormFieldWidget(
                hintText: 'Email',
                controller: TextEditingController(),
              ),
              SizedBox(height: 16,),
              AppTextFormFieldWidget(
                obscureText: true,
                  hintText: 'Password',
                  controller: TextEditingController(),
              )
            ],
        )
      ),
    );
  }
}
