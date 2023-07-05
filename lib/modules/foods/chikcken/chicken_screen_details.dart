import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/customer_checkout/CustomerCheckoutScreen.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/customer_checkout/cart_screen.dart';
import 'package:ostad_flutter_batch_two/modules/widgets/app_elevated_button.dart';
import 'package:get/get.dart';

class ChickenScreenDetails extends StatefulWidget {
  final String? title, url, price, email, mobile;

  const ChickenScreenDetails(
      {Key? key,
      required this.url,
      this.title,
      this.price,
      this.email,
      this.mobile})
      : super(key: key);

  @override
  State<ChickenScreenDetails> createState() => _ChickenScreenDetailsState();
}

class _ChickenScreenDetailsState extends State<ChickenScreenDetails> {
  bool inProgress = false;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<UserNumberFromFirebase> userNumberFromFirebase = [];

  Future<void> getUserNumber() async {
    inProgress = true;
    setState(() {});
    userNumberFromFirebase.clear();
    await firebaseFirestore.collection(widget.email.toString()).get().then(
          (documents) {
        for (var doc in documents.docs) {
          userNumberFromFirebase.add(
            UserNumberFromFirebase(
              doc.get('mobile number'),
            ),
          );
        }
      },
    );

    inProgress = false;
    setState(() {});
  }

  Future addDetailsToDatabase() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure for add to cart?'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('No')),
            TextButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection(userNumberFromFirebase[0].number.toString())
                      .add(
                    {
                      'title': widget.title.toString(),
                      'price': widget.price.toString(),
                      'image': widget.url.toString()
                    },
                  );
                  Get.showSnackbar(
                    const GetSnackBar(
                      title: 'Successfully added!',
                      message: ' ',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Get.to(CartScreen(
                    title: widget.title.toString(),
                    price: widget.price.toString(),
                    imageUrl: widget.url.toString(),
                    email: widget.email.toString(),
                    mobile: userNumberFromFirebase[0].number.toString(),
                  ));
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getUserNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    widget.url.toString(),
                    width: double.infinity,
                  ),
                ),
                Text(
                  widget.title.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Total Price : ${widget.price.toString()}',
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppElevatedButton(
                    color: Colors.redAccent,
                    text: 'Add to Cart',
                    onTap: () {
                      addDetailsToDatabase();
                    },
                  ),
                ),
                const SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserNumberFromFirebase {
  final String number;

  UserNumberFromFirebase(this.number);
}
