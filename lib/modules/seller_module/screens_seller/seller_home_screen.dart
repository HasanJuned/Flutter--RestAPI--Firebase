import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/screens_seller/show_result_screen.dart';
import '../../auth_screens/choose_auth_screen.dart';
import 'types_of_food_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen>
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
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.redAccent,
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
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
            width: screenSize.width,
            height: screenSize.height,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    hoverColor: Colors.red,
                    onTap: () {
                      Get.to(const TypesOfFoodScreen());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.redAccent.shade400
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add Food',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                                      Get.to(ShowResultScreen(
                                          stuId: stuIdController.text));
                                    },
                                    child: const Text('Yes')),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      //color: Colors.redAccent,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade400,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Order List',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
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
