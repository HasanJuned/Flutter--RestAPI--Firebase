import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mutton_screen_details.dart';

class MuttonScreen extends StatefulWidget {
  final String? email;

  const MuttonScreen({Key? key, this.email}) : super(key: key);

  @override
  State<MuttonScreen> createState() => _MuttonScreenState();
}

class _MuttonScreenState extends State<MuttonScreen> {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<FoodDetails> foodDetails = [];

  //var title = foodDetails[index].image.toString();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutton Screen'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: firebaseFirestore.collection('mutton').snapshots(),
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
              foodDetails.clear();
              for (var doc in snapshot.data!.docs) {
                foodDetails.add(
                  FoodDetails(
                    doc.get('title'),
                    doc.get('price'),
                    doc.get('description'),
                    doc.get('image'),
                  ),
                );
              }
            }
            return ListView.separated(
              itemCount: foodDetails.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.to(
                      MuttonScreenDetails(
                        title: foodDetails[index].title,
                        email: widget.email.toString(),
                        price: foodDetails[index].price,
                        url: foodDetails[index].image.toString(),
                      ),
                    );
                  },
                  title: Text(
                    foodDetails[index].title.toString(),
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
                        'Price : ${foodDetails[index].price.toString()} BDT',
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                          height: 100,
                          child: Text(
                            foodDetails[index].description.toString(),
                            style: const TextStyle(color: Colors.black54),
                          )),
                    ],
                  ),
                  trailing: Image.network(foodDetails[index].image.toString()),
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
    );
  }
}

class FoodDetails {
  final String? title, price, description, image;

  FoodDetails(this.title, this.price, this.description, this.image);
}
