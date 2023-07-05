import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/screens_customer/customer_home_menu_screen.dart';
import 'package:ostad_flutter_batch_two/modules/widgets/app_elevated_button.dart';

class CustomerCheckoutScreen extends StatefulWidget {
  final String? price, email, mobile;

  const CustomerCheckoutScreen({
    Key? key,
    this.price,
    this.email,
    this.mobile,
  }) : super(key: key);

  @override
  State<CustomerCheckoutScreen> createState() => _CustomerCheckoutScreenState();
}

class _CustomerCheckoutScreenState extends State<CustomerCheckoutScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<CustomerIdentity> customerIdentity = [];

  String? customerName;
  String? customerAddress;
  String? customerCall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        .collection(widget.email.toString())
                        .snapshots(),
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
                        customerIdentity.clear();
                        for (var doc in snapshot.data!.docs) {
                          customerIdentity.add(
                            CustomerIdentity(
                              doc.get('name'),
                              doc.get('address'),
                              doc.get('mobile number'),
                            ),
                          );
                          customerName = doc.get('name').toString();
                          customerAddress = doc.get('address').toString();
                          customerCall = doc.get('mobile number').toString();
                        }
                      }
                      return ListView.separated(
                        itemCount: customerIdentity.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Name : ${customerIdentity[index].name.toString()}',
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
                                    'Address : ${customerIdentity[index].address.toString()}',
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
                                    'Call : ${customerIdentity[index].mobile.toString()}',
                                    style: const TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Total Price : ${widget.price} BDT',
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
                height: 50,
              ),
              AppElevatedButton(
                color: Colors.redAccent,
                  text: 'Confirm Order',
                  onTap: () {
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
                              child: const Text(
                                'No',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await firebaseFirestore
                                    .collection('order list')
                                    .doc(customerCall.toString())
                                    .set(
                                  {
                                    'name': customerName.toString(),
                                    'total price': widget.price,
                                    'location': customerAddress.toString(),
                                    'call': customerCall.toString(),
                                  },
                                );
                                Get.showSnackbar(
                                  const GetSnackBar(
                                    title: 'Order Done!',
                                    message: 'Waiting for confirmation',
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Get.offAll(CustomerHomeMenuScreen(
                                  email: widget.email.toString(),
                                  mobile: widget.mobile.toString(),
                                ));
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
    );
  }
}

class CustomerIdentity {
  final String? name, address, mobile;

  CustomerIdentity(this.name, this.address, this.mobile);
}
