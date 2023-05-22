import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/user_auth_controller.dart';

import '../utils/styles.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_field.dart';
import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<UserAuthController>(builder: (authController) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/images/logo.png',
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Welcome Back',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Please Enter Your Email Address',
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 24,
            ),
            CommonTextField(
              hintText: 'Enter your email',
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Enter a valid email';
                }
                return null;
              },
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            authController.emailVerificationInProgress
                ? CircularProgressIndicator()
                : CommonElevatedButton(
                    title: 'Next',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final bool response = await authController
                            .emailVerification(_emailController.text);
                        if (response) {
                          Get.to(OTPVerificationScreen(email: _emailController.text,));
                        } else {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Email Verification Failed! Try again!')));
                          }
                        }
                      }
                    },
                  ),
          ]),
        ),
      );
    }));
  }
}
