import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/product.dart';
import '../screens/product_details_screen.dart';
import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key, required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: InkWell(
        onTap: () {
          Get.to(ProductDetailsScreen(productId: product.id!,));
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 3,
          shadowColor: primaryColor.withOpacity(0.2),
          child: Column(
            children: [
              Image.network(product.image ?? '',
                  height: 100, fit: BoxFit.scaleDown),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      product.title ?? 'Unknown',
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
                        Text(
                          '${product.price}',
                          style: const TextStyle(
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
                              '${product.star ?? 0}',
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
