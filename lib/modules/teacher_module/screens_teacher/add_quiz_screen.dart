import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/teacher_module/screens_teacher/teacher_dashboard_screen.dart';


class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({Key? key}) : super(key: key);

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {
  TextEditingController quizTitleController = TextEditingController();
  TextEditingController op1TitleController = TextEditingController();
  TextEditingController op2TitleController = TextEditingController();
  TextEditingController realAnswerTitleController = TextEditingController();
  TextEditingController teacherIdTitleController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future addQuiz() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure for submission?'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('No')),
            TextButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection(teacherIdTitleController.text).add({
                    'quiz title': quizTitleController.text,
                    'op1': op1TitleController.text,
                    'op2': op2TitleController.text,
                    'ans': realAnswerTitleController.text,
                    'teacherId': teacherIdTitleController.text,
                  });
                  Get.off(const TeacherDashboardScreen());

                  Get.showSnackbar(
                    const GetSnackBar(
                      title: 'Successfully added!',
                      message: ' ',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Add Quiz',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: teacherIdTitleController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Teacher ID';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Teacher ID (required)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  TextFormField(
                    controller: quizTitleController,
                    maxLines: 2,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Quiz Title';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Quiz title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: op1TitleController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Option 1';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'a',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: op2TitleController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Option 2';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'b', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: realAnswerTitleController,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Real Answer';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: 'Answer (a / b)', border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            addQuiz();
                          }
                        },
                        child: const Text('Submit')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
