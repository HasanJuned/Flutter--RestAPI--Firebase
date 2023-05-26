import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/product_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({Key? key, required this.categoryId})
      : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductsByCategory(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Products'),
          leading: const BackButton(
            color: greyColor,
          )),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          if(productController.getProductsByCategoryInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
              itemCount: productController.productByCategoryModel.products?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.7),
              itemBuilder: (context, index) {
              return ProductCardWidget(
                product: productController.productByCategoryModel.products![index],
              );
            });
        }
      ),
    );
  }
}
