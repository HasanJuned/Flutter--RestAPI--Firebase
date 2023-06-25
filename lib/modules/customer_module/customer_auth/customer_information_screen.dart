import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/customer_auth/customer_login_screen.dart';
import 'package:ostad_flutter_batch_two/modules/widgets/app_elevated_button.dart';

class CustomerInformationScreen extends StatefulWidget {
  final String? email;

  const CustomerInformationScreen({Key? key, required this.email})
      : super(key: key);

  @override
  State<CustomerInformationScreen> createState() =>
      _CustomerInformationScreenState();
}

class _CustomerInformationScreenState extends State<CustomerInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email.toString();
  }

  Future addInformation() async {
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
                child: const Text('No', style: TextStyle(color: Colors.redAccent),)),
            TextButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection(numberController.text)
                      .add({
                    'name': nameController.text,
                    'address': addressController.text,
                    'mobile number': numberController.text,
                    'email': widget.email.toString(),
                  });
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: 'Welcome',
                      message: 'Successfully Registered',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Get.off(const CustomerLoginScreen());
                },
                child: const Text('Yes', style: TextStyle(color: Colors.redAccent),)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Information',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            'This information will store in the database',
                            style: TextStyle(
                                color: Colors.yellowAccent, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: nameController,
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Name';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: 'Full Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: addressController,
                            maxLines: 2,
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Address';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: 'Address',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: numberController,
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Enter Mobile Number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              focusColor: Colors.white,
                              filled: true,
                              hintText: 'Mobile Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (String? value) {
                              if (value?.trim().isEmpty ?? true) {
                                return 'Email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                fillColor: Colors.white70,
                                focusColor: Colors.white,
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: AppElevatedButton(
                                text: 'Submit',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    addInformation();
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
