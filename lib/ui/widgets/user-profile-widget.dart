import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/loginScreen.dart';
import 'package:softbyhasan/ui/screens/update-profile-screen.dart';
import 'package:softbyhasan/ui/utils/auth-utils.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UpdateProfileScreen()));
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(
          '${AuthUtils.firstName ?? ''} ${AuthUtils.lastName ?? ''}',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          AuthUtils.email ?? 'Unknown',
          style: const TextStyle(color: Colors.white),
        ),
        tileColor: Colors.green,
        trailing: IconButton(
          onPressed: () {
            AuthUtils.clearData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false);
          },
          icon: const Icon(
            Icons.login_outlined,
            color: Colors.white,
          ),
        ));
  }
}
