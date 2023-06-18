import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/choose_auth_screen.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/student_login_screen.dart';
import 'package:ostad_flutter_batch_two/screens/student_home_screen.dart';
import 'package:ostad_flutter_batch_two/screens/teacher_home_screen.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ChooseAuthScreen();
        } else {
          return ChooseAuthScreen();
        }
      },
      ),
    );
  }
}
