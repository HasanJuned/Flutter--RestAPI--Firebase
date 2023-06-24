import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/screens_seller/seller_home_screen.dart';

import '../../foods/chikcken/add_chicken_screen.dart';
import '../../foods/drinks/add_drinks_screen.dart';
import '../../foods/mutton/add_mutton_screen.dart';


class TypesOfFoodScreen extends StatefulWidget {
  const TypesOfFoodScreen({Key? key}) : super(key: key);

  @override
  State<TypesOfFoodScreen> createState() => _TypesOfFoodScreenState();
}

class _TypesOfFoodScreenState extends State<TypesOfFoodScreen> {
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
                  Get.off(const SellerHomeScreen());

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
      appBar: AppBar(
        title: const Text('Foods'),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to(AddChickenScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent),
                           borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset('assets/images/chicken_icon.png', height: 70,),
                              const SizedBox(height: 4,),
                              const Text('Chicken', style: TextStyle(color: Colors.redAccent, letterSpacing: 1),),
                            ],
                          ),

                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          Get.to(AddDrinksScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset('assets/images/drinks_icon.jpeg', height: 70,),
                              const SizedBox(height: 4,),
                              const Text('Drinks', style: TextStyle(color: Colors.redAccent, letterSpacing: 1),),
                            ],
                          ),

                        ),
                      ),
                      const SizedBox(width: 20,),
                      InkWell(
                        onTap: (){
                          Get.to(AddMuttonScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset('assets/images/mutton_icon.png', height: 70, width: double.infinity,),
                              const SizedBox(height: 4,),
                              const Text('Mutton', style: TextStyle(color: Colors.redAccent, letterSpacing: 1),),
                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
