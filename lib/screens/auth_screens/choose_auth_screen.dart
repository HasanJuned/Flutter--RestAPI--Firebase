import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/student_register_screen.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/teacher_login_screen.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/teacher_registration_screen.dart';
import 'package:ostad_flutter_batch_two/screens/teacher_home_page_screen.dart';

import 'student_login_screen.dart';

class ChooseAuthScreen extends StatefulWidget {
  const ChooseAuthScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAuthScreen> createState() => _ChooseAuthScreenState();
}

class _ChooseAuthScreenState extends State<ChooseAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                'Login as : ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Get.to(StudentLoginScreen());
                  },
                  child: const Text(
                    'Student',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 40,
                width: 200,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    Get.to(TeacherLoginScreen());
                  },
                  child: const Text(
                    'Teacher',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
