import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigationBar_controller.dart';

import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backHome();
          },
          icon: Icon(Icons.arrow_back_rounded),
          color: greyColor,
        ),
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return ProductCardWidget();
          }),
    );
  }
}
