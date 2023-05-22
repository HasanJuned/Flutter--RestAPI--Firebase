import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/product_details_screen.dart';
import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsScreen());
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          shadowColor: primaryColor.withOpacity(0.2),
          child: Column(
            children: [
              Image.asset('assets/images/sneakers.jpg',
                  height: 100, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Apex Casual Sneakers B90X3',
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.3,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                          color: greyColor.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const Text(
                          '\$340',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor.withOpacity(0.8)),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 14,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
