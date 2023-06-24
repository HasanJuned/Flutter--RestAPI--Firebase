import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
        child: Text(
          text,
          style: const TextStyle(letterSpacing: 1),
        ),
      ),
    );
  }
}
