import 'package:flutter/material.dart';

import '../screens/sign-up-screen.dart';
class AppTextButton extends StatelessWidget {
  const AppTextButton({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1!),
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
            },
            child: Text(
              text2!,
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }
}