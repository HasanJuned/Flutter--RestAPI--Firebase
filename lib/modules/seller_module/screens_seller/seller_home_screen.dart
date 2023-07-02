import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<SellerInformation> sellerDetails = [];

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
          stream: firebaseFirestore.collection('01812848136').snapshots(),
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
                    doc.get('mobile number'),
                    doc.get('address'),
                    doc.get('email'),
                  ),
                );
              }
            }
            return ListView.separated(
              itemCount: sellerDetails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Get.to(
                    //   ChickenScreenDetails(
                    //     title: foodDetails[index].title,
                    //     price: foodDetails[index].price,
                    //     url: foodDetails[index].image.toString(),
                    //   ),
                    //);
                  },
                  title: Text(''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                  //trailing: Image.network(foodDetails[index].image.toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 3,
                );
              },
            );
          }),
    );
  }
}

class SellerInformation {
  final String? name, address, mobile, email;

  SellerInformation(this.name, this.address, this.mobile, this.email);
}
