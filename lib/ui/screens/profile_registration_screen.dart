import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/styles.dart';
import '../widgets/common_elevated_button.dart';
import '../widgets/common_text_field.dart';

class ProfileRegistrationScreen extends StatefulWidget {
  const ProfileRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<ProfileRegistrationScreen> createState() =>
      _ProfileRegistrationScreenState();
}

class _ProfileRegistrationScreenState extends State<ProfileRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Complete Profile',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Get started with us with your details',
                      style: subTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CommonTextField(
                      hintText: 'First Name',
                      validator: (String? value) {},
                      controller: TextEditingController(),
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Last Name',
                      validator: (String? value) {},
                      controller: TextEditingController(),
                      textInputType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Mobile',
                      validator: (String? value) {},
                      controller: TextEditingController(),
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'City',
                      validator: (String? value) {},
                      controller: TextEditingController(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Shipping Address',
                      validator: (String? value) {},
                      controller: TextEditingController(),
                      maxLine: 5,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CommonElevatedButton(
                      title: 'Complete',
                      onTap: () {
                        //Get.to(const OTPVerificationScreen());
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    ));
  }
}
