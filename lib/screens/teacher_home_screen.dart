import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/choose_auth_screen.dart';
import 'package:ostad_flutter_batch_two/screens/auth_screens/student_login_screen.dart';
class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Info'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
            Get.to(ChooseAuthScreen());
    }, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed : '+ user.email!),
          ],
        ),
      ),
    );
  }
}
