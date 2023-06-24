import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth_screens/choose_auth_screen.dart';
import 'customer_home_menu_screen.dart';

class CustomerMenuScreen extends StatefulWidget {
  final String? id;

  const CustomerMenuScreen({Key? key, this.id}) : super(key: key);

  @override
  State<CustomerMenuScreen> createState() => _CustomerMenuScreenState();
}

class _CustomerMenuScreenState extends State<CustomerMenuScreen>
    with WidgetsBindingObserver {
  //final user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? teacherId;
  List<TeacherId> id = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
    //getId();
    print(teacherId);
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
        title: const Text('Student Info'),
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
          child: StreamBuilder<QuerySnapshot>(
              stream: firebaseFirestore
                  .collection(widget.id.toString())
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
                  id.clear();
                  for (var doc in snapshot.data!.docs) {
                    id.add(
                      TeacherId(
                        doc.get('teacherId'),
                      ),
                    );
                  }
                  return InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Enter Your Teacher ID'),
                              content: TextField(
                                onChanged: (value) {
                                  teacherId = value;
                                  // print(teacherId);
                                  // print(widget.id);
                                  ;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'ID',
                                ),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('No')),
                                TextButton(
                                    onPressed: () {
                                      if (teacherId == widget.id.toString()) {
                                        Get.to(CustomerHomeMenuScreen(
                                        ));
                                        Get.showSnackbar(
                                          const GetSnackBar(
                                            title: 'Success',
                                            message: 'Best of luck',
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      } else {
                                        Get.showSnackbar(
                                          const GetSnackBar(
                                            title: 'Error ID',
                                            message: 'Check again',
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text('Yes')),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 100,
                      width: 140,
                      color: Colors.lightBlue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Pick Quiz',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class TeacherId {
  final String? teacherId;

  TeacherId(this.teacherId);
}
