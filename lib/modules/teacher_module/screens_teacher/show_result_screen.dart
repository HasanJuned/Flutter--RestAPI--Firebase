import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/teacher_module/screens_teacher/teacher_dashboard_screen.dart';

import '../../student_module/screens_student/my_result_screen.dart';


class ShowResultScreen extends StatefulWidget {
  final String stuId;

  const ShowResultScreen({Key? key, required this.stuId}) : super(key: key);

  @override
  State<ShowResultScreen> createState() => _ShowResultScreenState();
}

class _ShowResultScreenState extends State<ShowResultScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController answerController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// --> Collection of Database
  List<StudentResult> quizResult = [];
  bool inProgress = false;
  String? selectedAns;
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Student Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: StreamBuilder<QuerySnapshot>(
                    stream: firebaseFirestore
                        .collection(widget.stuId.toString())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      if (snapshot.hasData) {
                        quizResult.clear();
                        for (var doc in snapshot.data!.docs) {
                          quizResult.add(
                            StudentResult(
                              doc.get('student name'),
                              doc.get('student id'),
                              doc.get('score'),
                            ),
                          );
                        }
                        return ListView.builder(
                            itemCount: quizResult.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Column(
                                  children: [
                                    Text('Name : ${quizResult[index].stuName ?? 'Unknown Name'}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'ID : ${quizResult[index].stuIdd ?? 'Unknown Student ID'}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Score : ${quizResult[index].stuScore ?? 'Unknown Score'}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('No data available'),
                        );
                      }
                    }),
              ),
            ),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Get.offAll(const TeacherDashboardScreen());
                }, child: const Text('Return Home')))
          ],
        ),
      ),
    );
  }
}

class StudentResult {
  final String? stuIdd, stuName, stuScore;

  StudentResult(this.stuName, this.stuIdd, this.stuScore);
}
