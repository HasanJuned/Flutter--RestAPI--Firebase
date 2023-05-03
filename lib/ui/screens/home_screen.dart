import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person_outline_outlined,
              onTap: (){

              },
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: (){

              },
            ),
            AppBarIconButton(
              iconData: Icons.notifications_active,
              onTap: (){

              },
            ),

          ],
        ),
      ),
    );
  }
}

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: primaryColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 16,
          child: Icon(iconData, color: softGreyColor, size: 18),
        ),
      ),
    );
  }
}
