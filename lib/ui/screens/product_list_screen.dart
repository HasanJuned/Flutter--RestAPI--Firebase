import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/widgets/product_card_widget.dart';

import '../utils/app_colors.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Products'),
            leading: BackButton(
              color: greyColor,
            )),
        body: GridView.builder(
            itemCount: 40,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
              childAspectRatio: 0.7
        ),
        itemBuilder: (context, index) {
          return ProductCardWidget();
        }),);
  }
}
