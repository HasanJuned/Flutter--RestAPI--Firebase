import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/teacher_module/screens_teacher/show_result_screen.dart';
import '../../auth_screens/choose_auth_screen.dart';
import 'add_quiz_screen.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen>
    with WidgetsBindingObserver {
  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController stuIdController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void deactivate() {
    WidgetsBinding.instance?.addObserver(this);
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.addObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Info'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.off(const ChooseAuthScreen());
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                hoverColor: Colors.red,
                onTap: () {
                  Get.to(const AddQuizScreen());
                },
                child: Container(
                  height: 100,
                  width: 140,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Add Quiz',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Which Student Result to see (ID)'),
                          content: SizedBox(
                            height: 150,
                            width: 200,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: stuIdController,
                                  validator: (String? value) {
                                    if (value?.trim().isEmpty ?? true) {
                                      return 'Enter Student ID';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: 'Student ID',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () async {
                                  Get.showSnackbar(
                                    const GetSnackBar(
                                      title: 'Successfully Submitted!',
                                      message: ' ',
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Get.to(ShowResultScreen(stuId: stuIdController.text));
                                },
                                child: const Text('Yes')),
                          ],
                        );
                      });
                },
                child: Container(
                  height: 100,
                  width: 140,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Student Result',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
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
