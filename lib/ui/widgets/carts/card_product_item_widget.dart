import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/state_managers/cart_controller.dart';

import '../../../data/models/cart_list_model.dart';
import '../../../data/models/product.dart';
import '../../utils/app_colors.dart';
import '../product_stepper_widget.dart';
import 'package:get/get.dart';
class CardProductItemWidget extends StatefulWidget {
  CardProductItemWidget({
    Key? key,
    required this.cartData,
  }) : super(key: key);

  CartData cartData;

  @override
  State<CardProductItemWidget> createState() => _CardProductItemWidgetState();
}

class _CardProductItemWidgetState extends State<CardProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              widget.cartData.product?.image ?? '',
              width: 120,
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartData.product?.title ?? '',
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size : ${widget.cartData.size}',
                                  style: TextStyle(color: greyColor),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Color : ${widget.cartData.color}',
                                  style: const TextStyle(color: greyColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: softGreyColor,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cartData.product?.price ?? '',
                        style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      ProductStepperWidget(
                        onDecrement: (int currentValue) {
                          Get.find<CartController>().decrementItem(widget.cartData.id!);

                        },
                        onIncrement: (int currentValue) {
                          Get.find<CartController>().incrementItem(widget.cartData.id!);


                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
