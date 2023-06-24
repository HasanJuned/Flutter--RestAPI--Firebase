import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';

import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_text_field.dart';
import 'drinks_screen.dart';

class AddDrinksScreen extends StatefulWidget {
  const AddDrinksScreen({Key? key}) : super(key: key);

  @override
  State<AddDrinksScreen> createState() => _AddDrinksScreenState();
}

class _AddDrinksScreenState extends State<AddDrinksScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  XFile? pickedImage;
  String? imageUrl;
  String? fileName;

  /// Image pick from gallery
  Future<void> imagePickerFunction() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick Image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Gallery'),
                  leading: const Icon(Icons.image),
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    log(pickedImage!.path);

                    if (pickedImage == null) {
                      return;
                    }

                    fileName = DateTime.now().millisecondsSinceEpoch.toString();
                  },
                ),
              ],
            ),
          );
        });
  }

  /// Upload the details of food to firebase storage
  Future addDetailsToDatabase() async {
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
                  await FirebaseFirestore.instance.collection('drinks').add({
                    'title': titleController.text,
                    'price': priceController.text,
                    'description': descriptionController.text,
                    'image': imageUrl ?? 'Unavailable pic',
                  });

                  Get.showSnackbar(
                    const GetSnackBar(
                      title: 'Successfully added!',
                      message: ' ',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Get.to(const DrinksScreen());

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
      appBar: AppBar(
        title: const Text('Add Drinks'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      imagePickerFunction();
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          child: const Text('Photos'),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8))),
                            child: Text(
                              pickedImage?.name ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextFields(
                    controller: titleController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter title';
                      }
                      return null;
                    },
                    hintText: 'Title',
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFields(
                    controller: priceController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter price';
                      }
                      return null;
                    },
                    hintText: 'Price',
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextFields(
                    controller: descriptionController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter description';
                      }
                      return null;
                    },
                    hintText: 'Description',
                    color: Colors.redAccent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppElevatedButton(
                    text: 'Submit',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {

                        /// Upload the images to firebase storage
                        Reference refereneceRoot =
                        FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                        refereneceRoot.child('drinks_images');
                        Reference referenceImageToUpload =
                        referenceDirImages.child(fileName!);

                        try {
                          await referenceImageToUpload.putFile(File(pickedImage!.path));
                          imageUrl = await referenceImageToUpload.getDownloadURL();
                          log('success');
                        } catch (e) {
                          log('Upload failed. Try again!');
                        }

                        ///  then food details store in the firestore database
                        addDetailsToDatabase();

                      }
                    },
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
