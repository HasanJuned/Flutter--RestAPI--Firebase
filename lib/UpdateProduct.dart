import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  Map<String?, dynamic> nameProduct;
  UpdateProduct({required this.nameProduct,Key? key}) : super(key: key);

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
    );
  }
}
