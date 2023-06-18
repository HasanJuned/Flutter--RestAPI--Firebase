import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/screens/student_home_screen.dart';

import '../teacher_home_screen.dart';

class StudentRegisterScreen extends StatefulWidget {
  const StudentRegisterScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegisterScreen> createState() => _StudentRegisterScreenState();
}

class _StudentRegisterScreenState extends State<StudentRegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Get.to(StudentHomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Student Registration',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.green))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            register();
                            Get.showSnackbar(
                              const GetSnackBar(
                                title: 'Welcome',
                                message: 'Successfully Registered',
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: const Text('Next', style: TextStyle(fontSize: 16),)),
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
