import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth_screens/choose_auth_screen.dart';
import '../../foods/chikcken/chicken_screen.dart';
import '../../foods/drinks/drinks_screen.dart';
import '../../foods/mutton/mutton_screen.dart';

class CustomerHomeMenuScreen extends StatefulWidget {
  const CustomerHomeMenuScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeMenuScreen> createState() => _CustomerHomeMenuScreenState();
}

class _CustomerHomeMenuScreenState extends State<CustomerHomeMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Available Food',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Wrap(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ChickenScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              border: Border.all(
                                  color: Colors.white.withGreen(10), width: 2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset(
                                'assets/images/chicken_icon.png',
                                height: 70,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Chicken',
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1,fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(DrinksScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.white.withGreen(10), width: 2),
                          ),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset(
                                'assets/images/drinks_icon.jpeg',
                                height: 70,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Drinks',
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1,fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(MuttonScreen());
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            border: Border.all(
                                color: Colors.white.withGreen(10), width: 2),
                          ),
                          child: Column(
                            children: [
                              //Icon(Icons.fastfood_outlined, color: Colors.white, size: 40,),
                              Image.asset(
                                'assets/images/mutton_icon.png',
                                height: 70,
                                width: double.infinity,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Mutton',
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 1, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
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
