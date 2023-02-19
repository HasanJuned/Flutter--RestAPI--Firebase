import 'package:flutter/material.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  const AppTextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none
          )
      ),

    );
  }
}