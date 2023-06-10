import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/bottom_navigationBar_controller.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/cart_controller.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';
import 'package:get/get.dart';

import '../widgets/carts/card_product_item_widget.dart';
import '../widgets/common_elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartController>().getCartList();
    });
  }

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
      body: GetBuilder<CartController>(builder: (cartController) {
        if (cartController.getCartToListInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.catListModel.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CardProductItemWidget(cartData: cartController.catListModel.data![index]);
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
                          GetBuilder<CartController>(
                            builder: (cartController) {
                              return Text(
                                '\$${cartController.totalPrice}',
                                style: const TextStyle(
                                    fontSize: 18, color: primaryColor),
                              );
                            }
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
          );
        }
      }),
    );
  }
}
