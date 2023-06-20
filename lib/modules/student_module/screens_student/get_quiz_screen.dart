import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_result_screen.dart';

class GetQuizScreen extends StatefulWidget {
  final String? teacherId;

  const GetQuizScreen({Key? key, required this.teacherId}) : super(key: key);

  @override
  State<GetQuizScreen> createState() => _GetQuizScreenState();
}

class _GetQuizScreenState extends State<GetQuizScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController answerController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// --> Collection of Database
  List<Quiz> quiz = [];
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
        title: const Text('Student Info'),
      ),
      body: Form(
        key: formKey,
        child: StreamBuilder<QuerySnapshot>(
            stream: firebaseFirestore
                .collection(widget.teacherId.toString())
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
                quiz.clear();
                for (var doc in snapshot.data!.docs) {
                  quiz.add(
                    Quiz(
                      doc.get('quiz title'),
                      doc.get('op1'),
                      doc.get('op2'),
                      doc.get('ans'),
                      doc.get('teacherId'),
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: quiz.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Text('~ ${quiz[index].quizTitle ?? 'Unknown Title'}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                'a. ${quiz[index].op1 ?? 'Unknown Option 1'}',
                                style: const TextStyle(fontSize: 16),
                              ),

                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'b. ${quiz[index].op2 ?? 'Unknown Option 2'}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 2,
                              validator: (String? value) {
                                if (value?.trim().isEmpty ?? true) {
                                  return 'Write the ans just a / b';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //print(value);
                                selectedAns = value;
                                if (selectedAns == quiz[index].answer) {
                                  counter++;
                                  //counter = 0;
                                }
                                print(counter);
                              },
                              decoration: const InputDecoration(
                                  hintText:
                                      "Must write here 'a' or 'b' for answer, otherwise 1 mark will be deducted !",
                                  focusColor: Colors.grey,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Enter Information'),
                    content: SizedBox(
                      height: 150,
                      width: 200,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your name';
                              }
                              return null;
                            },
                            controller: studentNameController,
                            decoration: const InputDecoration(
                              hintText: 'Student Name',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: studentIdController,
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter your ID';
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
                            await FirebaseFirestore.instance
                                .collection(studentIdController.text)
                                .add({
                              'student name': studentNameController.text,
                              'student id': studentIdController.text,
                              'score': counter.toString(),
                            });
                            Get.off(
                                MyResultScreen(score: counter.toString()));

                            Get.showSnackbar(
                              const GetSnackBar(
                                title: 'Successfully Submitted!',
                                message: ' ',
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: const Text('Yes')),
                    ],
                  );
                });
          }
        },
        child: const Text(
          'Submit',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class Quiz {
  final String? quizTitle, op1, op2, answer, teacherId;

  Quiz(this.quizTitle, this.op1, this.op2, this.answer, this.teacherId);
}
