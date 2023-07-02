import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/customer_auth/customer_login_screen.dart';

import '../../../fcm_utils.dart';
import '../../auth_screens/choose_auth_screen.dart';
import '../../foods/chikcken/chicken_screen.dart';
import '../../foods/drinks/drinks_screen.dart';
import '../../foods/mutton/mutton_screen.dart';
import '../customer_checkout/cart_screen.dart';

class CustomerHomeMenuScreen extends StatefulWidget {
  final String? email, mobile;

  const CustomerHomeMenuScreen({Key? key, this.email, this.mobile})
      : super(key: key);

  @override
  State<CustomerHomeMenuScreen> createState() => _CustomerHomeMenuScreenState();
}

class _CustomerHomeMenuScreenState extends State<CustomerHomeMenuScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<UserDetails> userDetails = [];
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

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
              Get.offAll(const ChooseAuthScreen());
            },
            icon: const Icon(Icons.logout_outlined),
          ),
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
                          Get.to(ChickenScreen(
                            email: widget.email.toString(),
                            mobile: widget.mobile.toString(),
                          ));
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
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontSize: 16),
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
                          Get.to(
                            DrinksScreen(
                              email: widget.email.toString(),
                              mobile: widget.mobile.toString(),
                            ),
                          );
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
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontSize: 16),
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
                          Get.to(MuttonScreen(
                            email: widget.email.toString(),
                            mobile: widget.mobile.toString(),
                          ));
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
                                    color: Colors.black,
                                    letterSpacing: 1,
                                    fontSize: 16),
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
      drawer: StreamBuilder<QuerySnapshot>(
          stream:
              firebaseFirestore.collection(widget.email.toString()).snapshots(),
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
              userDetails.clear();
              for (var doc in snapshot.data!.docs) {
                userDetails.add(
                  UserDetails(
                    doc.get('name'),
                    doc.get('address'),
                    doc.get('mobile number'),
                    doc.get('email'),
                  ),
                );
              }
            }
            return SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Drawer(
                  backgroundColor: Colors.white,
                  child: ListView.separated(
                    itemCount: userDetails.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          DrawerHeader(
                              padding: const EdgeInsets.all(0),
                              child: UserAccountsDrawerHeader(
                                currentAccountPicture: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.blueGrey,
                                ),
                                decoration:
                                    const BoxDecoration(color: Colors.green),
                                accountName: Text(
                                  userDetails[index].name.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 0.9),
                                ),
                                accountEmail: Text(
                                    userDetails[index].email.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        letterSpacing: 0.9)),
                                currentAccountPictureSize:
                                    const Size.square(50),
                              )),
                          ListTile(
                            leading: const Icon(
                              Icons.home,
                              color: Colors.redAccent,
                            ),
                            title: const Text(
                              'Home',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                            hoverColor: Colors.grey,
                            onTap: () {
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Colors.redAccent,
                            ),
                            title: const Text(
                              'Profile',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                            hoverColor: Colors.grey,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Column(
                                        children: [
                                          Text(userDetails[index]
                                              .name
                                              .toString()),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            userDetails[index]
                                                .address
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            userDetails[index]
                                                .mobile
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.7),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            userDetails[index].email.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.7),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'Ok',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            )),
                                      ],
                                    );
                                  });
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.question_mark,
                              color: Colors.redAccent,
                            ),
                            title: const Text(
                              'About Us',
                              style: TextStyle(
                                  letterSpacing: 1,
                                  color: Colors.black,
                                  fontSize: 17),
                            ),
                            hoverColor: Colors.grey,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Column(
                                        children: const [
                                          Text('Food Company Name'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'We serve food for you!',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'Ok',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            )),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 3,
                      );
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class UserDetails {
  final String? name, address, mobile, email;

  UserDetails(this.name, this.address, this.mobile, this.email);
}
