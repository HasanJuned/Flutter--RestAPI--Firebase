import 'package:flutter/material.dart';

import '../utils/text-styles.dart';
import '../widgets/app-elevated-button.dart';
import '../widgets/app-text-form-field.dart';
import '../widgets/screen-Background-images.dart';
import '../widgets/user-profile-widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileWidget(),
            Expanded(
              child: ScreenBackground(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Update Profile',
                              style: screenTitleTextStyle,
                            ),
                            const SizedBox(height: 16,),
                            InkWell(
                              onTap: (){

                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8)
                                      )
                                    ),
                                    child: const Text('Photos'),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)
                                        )
                                      ),
                                      child: const Text(''),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 16,),
                            AppTextFormFieldWidget(
                                hintText: 'Email',
                                controller: TextEditingController()),
                            const SizedBox(height: 10,),
                            AppTextFormFieldWidget(
                                hintText: 'First Name',
                                controller: TextEditingController()
                            ),
                            const SizedBox(height: 10,),
                            AppTextFormFieldWidget(
                                hintText: 'Last Name',
                                controller: TextEditingController()
                            ),
                            const SizedBox(height: 10,),
                            AppTextFormFieldWidget(
                                hintText: 'Mobile',
                                controller: TextEditingController()
                            ),
                            const SizedBox(height: 10,),
                            AppTextFormFieldWidget(
                                obscureText: true,
                                hintText: 'Password',
                                controller: TextEditingController()
                            ),
                            const SizedBox(height: 24,),
                            AppElevatedButton(
                                child: Icon(Icons.arrow_circle_right_outlined),
                                ontap: (){})
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
