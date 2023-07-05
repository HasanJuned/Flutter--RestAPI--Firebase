import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/seller_module/screens_seller/order_list_screen.dart';
import '../../auth_screens/choose_auth_screen.dart';
import 'types_of_food_screen.dart';

class SellerHomeScreen extends StatefulWidget {
  final String? email;
  const SellerHomeScreen({Key? key, this.email}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen>
    with WidgetsBindingObserver {
  final user = FirebaseAuth.instance.currentUser!;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<SellerInformation> sellerDetails = [];

  TextEditingController stuIdController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void deactivate() {
    WidgetsBinding.instance.addObserver(this);
    super.deactivate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addObserver(this);
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
                        color: Colors.redAccent.shade400,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Add Food',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
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
                      Get.to(const OrderListScreen());
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      //color: Colors.redAccent,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Order List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
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
              sellerDetails.clear();
              for (var doc in snapshot.data!.docs) {
                sellerDetails.add(
                  SellerInformation(
                    doc.get('owner name'),
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
                    itemCount: sellerDetails.length,
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
                                  sellerDetails[index].name.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      letterSpacing: 0.9),
                                ),
                                accountEmail: Text(
                                    sellerDetails[index].email.toString(),
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
                              'Admin Profile',
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
                                          Text(sellerDetails[index]
                                              .name
                                              .toString()),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            sellerDetails[index]
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
                                            sellerDetails[index]
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
                                            sellerDetails[index].email.toString(),
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

class SellerInformation {
  final String? name, address, mobile, email;

  SellerInformation(this.name, this.address, this.mobile, this.email);
}