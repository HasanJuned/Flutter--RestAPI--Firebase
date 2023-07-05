import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_details_confirmation_screen.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<CustomerFoodOrderDetails> customerFoodOrderDetails = [];
  var serialCounter2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order List'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firebaseFirestore.collection('order list').snapshots(),
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
              customerFoodOrderDetails.clear();
              for (var doc in snapshot.data!.docs) {
                customerFoodOrderDetails.add(
                  CustomerFoodOrderDetails(
                    doc.get('name'),
                    doc.get('total price'),
                    doc.get('location'),
                    doc.get('call'),
                  ),
                );
              }
            }
            return ListView.separated(
              itemCount: customerFoodOrderDetails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      OrderDetailsConfirmationScreen(
                        name: customerFoodOrderDetails[index].name.toString(),
                        totalPrice: customerFoodOrderDetails[index]
                            .totalPrice
                            .toString(),
                        location:
                            customerFoodOrderDetails[index].location.toString(),
                        call: customerFoodOrderDetails[index].call.toString(),
                      ),
                    );
                  },
                  title: Text(
                    '${serialCounter2++}. Order by : ${customerFoodOrderDetails[index].name.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Total Price : ${customerFoodOrderDetails[index].totalPrice.toString()} BDT',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 25,
                        child: Text(
                          'Location : ${customerFoodOrderDetails[index].location.toString()}',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              letterSpacing: 0.8),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Text(
                          'Call : ${customerFoodOrderDetails[index].call.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // trailing: Image.network(
                  //     customerFoodOrderDetails[index].image.toString()),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                  color: Colors.green,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CustomerFoodOrderDetails {
  final String? name, totalPrice, location, call;

  CustomerFoodOrderDetails(
      this.name, this.totalPrice, this.location, this.call);
}
