import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../state_managers/bottom_navigationBar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/home/category_card_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backHome();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: greyColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 60,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              return const CategoryCardWidget(
                productName: 'Computer',
              );
            }),
      ),
    );
  }
}
