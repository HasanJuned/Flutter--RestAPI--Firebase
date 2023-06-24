import 'package:flutter/material.dart';

class AppTextFields extends StatelessWidget {
  const AppTextFields({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.textInputType,
    this.maxLine,
    required this.color,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: color,
          controller: controller,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color, width: 2),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
