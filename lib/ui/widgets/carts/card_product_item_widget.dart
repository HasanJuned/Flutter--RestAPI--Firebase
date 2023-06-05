import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../product_stepper_widget.dart';

class CardProductItemWidget extends StatelessWidget {
  const CardProductItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.asset(
            'assets/images/sneakers.jpg',
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
                          const Text(
                            'New Shoe of Nike',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: greyColor),
                          ),
                          Row(
                            children: const [
                              Text(
                                'Size : 12',
                                style: TextStyle(color: greyColor),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Color : Green',
                                style: TextStyle(color: greyColor),
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
                  children: const [
                    Text(
                      '\$1000',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    ProductStepperWidget()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
