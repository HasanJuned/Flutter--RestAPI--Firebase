import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_elevated_button.dart';

class OrderDetailsConfirmationScreen extends StatefulWidget {
  final String? name, totalPrice, location, call;

  const OrderDetailsConfirmationScreen(
      {Key? key, this.name, this.totalPrice, this.location, this.call})
      : super(key: key);

  @override
  State<OrderDetailsConfirmationScreen> createState() =>
      _OrderDetailsConfirmationScreenState();
}

class _OrderDetailsConfirmationScreenState
    extends State<OrderDetailsConfirmationScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<FoodListOrderByCustomer> foodListOrderByCustomer = [];

  //List<CustomerIdentity> customerIdentity = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Order List',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '(Scrollable order list if 3+)',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 270,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.redAccent, width: 3),
                  ),
                  child: Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: firebaseFirestore
                          .collection(widget.call.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          //foodListOrderByCustomer.clear();
                          for (var doc in snapshot.data!.docs) {
                            foodListOrderByCustomer.add(
                              FoodListOrderByCustomer(
                                doc.get('title'),
                                doc.get('price'),
                                doc.get('image'),
                              ),
                            );
                          }
                        }
                        return ListView.separated(
                          itemCount: foodListOrderByCustomer.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {},
                              title: Text(
                                foodListOrderByCustomer[index].title.toString(),
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Price : ${foodListOrderByCustomer[index].price.toString()} BDT',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.redAccent),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                              trailing: Image.network(
                                  foodListOrderByCustomer[index]
                                      .image
                                      .toString()),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              thickness: 3,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Order By',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      fontSize: 18),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.redAccent, width: 3),
                  ),
                  child: Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: firebaseFirestore
                          .collection('hasan@gmail.com')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                          // customerIdentity.clear();
                          // for (var doc in snapshot.data!.docs) {
                          //   customerIdentity.add(
                          //     CustomerIdentity(
                          //       doc.get('name'),
                          //       doc.get('address'),
                          //       doc.get('mobile number'),
                          //     ),
                          //   );
                          //   customerName = doc.get('name').toString();
                          //   customerAddress = doc.get('address').toString();
                          //   customerCall = doc.get('mobile number').toString();
                          // }
                        }
                        return ListView.separated(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Name : ${widget.name.toString()}',
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: 1),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Address : ${widget.location.toString()}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.green,
                                          letterSpacing: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Call : ${widget.call.toString()}',
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Total Price : ${widget.totalPrice} BDT',
                                      style: const TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.8),
                                    )
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              thickness: 3,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppElevatedButton(
                    color: Colors.green,
                    text: 'Confirm Order',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text(
                                'Are you sure for confirm this order?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // await firebaseFirestore
                                  //     .collection('order list')
                                  //     .doc(customerCall.toString())
                                  //     .set(
                                  //   {
                                  //     'name': customerName.toString(),
                                  //     'total price': widget.price,
                                  //     'location': customerAddress.toString(),
                                  //     'call': customerCall.toString(),
                                  //   },
                                  // );
                                  // Get.showSnackbar(
                                  //   const GetSnackBar(
                                  //     title: 'Order Done!',
                                  //     message: 'Waiting for confirmation',
                                  //     duration: Duration(seconds: 2),
                                  //     backgroundColor: Colors.green,
                                  //   ),
                                  // );
                                  // Get.offAll(CustomerHomeMenuScreen(
                                  //   email: widget.email.toString(),
                                  //   mobile: widget.mobile.toString(),
                                  // ));
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                AppElevatedButton(
                    color: Colors.purple,
                    text: 'In Progress',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Confirmation'),
                            content: const Text(
                                'In Progress this order?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // await firebaseFirestore
                                  //     .collection('order list')
                                  //     .doc(customerCall.toString())
                                  //     .set(
                                  //   {
                                  //     'name': customerName.toString(),
                                  //     'total price': widget.price,
                                  //     'location': customerAddress.toString(),
                                  //     'call': customerCall.toString(),
                                  //   },
                                  // );
                                  // Get.showSnackbar(
                                  //   const GetSnackBar(
                                  //     title: 'Order Done!',
                                  //     message: 'Waiting for confirmation',
                                  //     duration: Duration(seconds: 2),
                                  //     backgroundColor: Colors.green,
                                  //   ),
                                  // );
                                  // Get.offAll(CustomerHomeMenuScreen(
                                  //   email: widget.email.toString(),
                                  //   mobile: widget.mobile.toString(),
                                  // ));
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                AppElevatedButton(
                    color: Colors.red,
                    text: 'Reject Order',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Warning', style: TextStyle(color: Colors.redAccent),),
                            content: const Text(
                                'Are you sure for reject this order?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(
                                  'No',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // await firebaseFirestore
                                  //     .collection('order list')
                                  //     .doc(customerCall.toString())
                                  //     .set(
                                  //   {
                                  //     'name': customerName.toString(),
                                  //     'total price': widget.price,
                                  //     'location': customerAddress.toString(),
                                  //     'call': customerCall.toString(),
                                  //   },
                                  // );
                                  // Get.showSnackbar(
                                  //   const GetSnackBar(
                                  //     title: 'Order Done!',
                                  //     message: 'Waiting for confirmation',
                                  //     duration: Duration(seconds: 2),
                                  //     backgroundColor: Colors.green,
                                  //   ),
                                  // );
                                  // Get.offAll(CustomerHomeMenuScreen(
                                  //   email: widget.email.toString(),
                                  //   mobile: widget.mobile.toString(),
                                  // ));
                                },
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodListOrderByCustomer {
  final String? title, price, image;

  FoodListOrderByCustomer(this.title, this.price, this.image);
}
