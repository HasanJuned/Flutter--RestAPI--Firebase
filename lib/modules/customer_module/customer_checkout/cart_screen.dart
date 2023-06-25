import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/customer_checkout/CustomerCheckoutScreen.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/screens_customer/customer_home_menu_screen.dart';
import 'package:ostad_flutter_batch_two/modules/widgets/app_elevated_button.dart';

class CartScreen extends StatefulWidget {
  final String? title, price, imageUrl, email;

  const CartScreen(
      {Key? key, this.title, this.price, this.imageUrl, this.email})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<CartFood> cartFood = [];

  //var title = foodDetails[index].image.toString();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: (){
            Get.offAll(CustomerHomeMenuScreen(email: widget.email.toString(),));
          }, icon: const Icon(Icons.add, size: 28,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
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
              cartFood.clear();
              for (var doc in snapshot.data!.docs) {
                cartFood.add(
                  CartFood(
                    doc.get('title'),
                    doc.get('price'),
                    doc.get('image'),
                  ),
                );
              }
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cartFood.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        title: Text(
                          cartFood[index].title.toString(),
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
                              'Price : ${cartFood[index].price.toString()} BDT',
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
                        trailing: Image.network(cartFood[index].image.toString()),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        thickness: 3,
                      );
                    },
                  ),
                ),
                AppElevatedButton(text: 'Checkout', onTap: (){
                  Get.to(CustomerCheckoutScreen(price: '1020', email: widget.email.toString()));

                }),
                const SizedBox(height: 16,)
              ],
            );
          },
        ),
      ),
    );
  }
}

class CartFood {
  final String? title, price, image;

  CartFood(this.title, this.price, this.image);
}
