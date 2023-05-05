import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      decoration: InputDecoration(
        fillColor: softGreyColor.withOpacity(0.1),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const Icon(
          Icons.search,
          color: softGreyColor,
        ),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}