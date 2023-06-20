import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../teacher_module/teacher_auth/teacher_login_screen.dart';


import '../student_module/student_auth/student_login_screen.dart';

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
              const Text(
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
                    Get.off(const StudentLoginScreen());
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
                    Get.off(const TeacherLoginScreen());
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
