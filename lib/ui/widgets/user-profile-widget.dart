import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/update-profile-screen.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
      },
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0
      ),
      leading: CircleAvatar(child: Icon(Icons.person)),
      title: Text('Hasan Ahmad'),
      subtitle: Text('hasan@gmail.com'),
      tileColor: Colors.green,
    );
  }
}
