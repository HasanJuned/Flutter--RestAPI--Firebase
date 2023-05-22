import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_two/ui/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        leading: BackButton(
          color: greyColor,
        ),
      ),
    );
  }
}
