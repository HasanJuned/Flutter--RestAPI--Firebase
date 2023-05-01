import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.textInputType,
    this.maxLine,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String? ) validator;
  final String hintText;
  final TextInputType? textInputType;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: softGreyColor),
          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2)
          )
      ),
      maxLines: maxLine,

    );
  }
}
