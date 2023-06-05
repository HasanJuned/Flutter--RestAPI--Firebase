import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigationBar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_stepper_widget.dart';

import '../state_managers/auth_controller.dart';
import '../widgets/carts/card_product_item_widget.dart';
import '../widgets/common_elevated_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        leading: IconButton(
            onPressed: () {
              Get.find<BottomNavigationBarController>().backHome();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: greyColor,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const CardProductItemWidget();
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      const Text(
                        '\$3000',
                        style:
                            const TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: CommonElevatedButton(
                      onTap: () async {},
                      title: "Checkout",
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

