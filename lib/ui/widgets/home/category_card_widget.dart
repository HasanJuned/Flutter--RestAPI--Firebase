import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/product_list_screen.dart';
import '../../utils/app_colors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    Key? key, required this.productName,
  }) : super(key: key);

  final String productName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const ProductListScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.computer, color: primaryColor, size: 28,),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(productName, style: const TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6
            ),),
          ],
        ),
      ),
    );
  }
}
