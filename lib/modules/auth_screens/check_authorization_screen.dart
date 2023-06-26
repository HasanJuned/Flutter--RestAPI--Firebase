import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_two/modules/auth_screens/choose_auth_screen.dart';
import 'package:ostad_flutter_batch_two/modules/customer_module/screens_customer/customer_home_menu_screen.dart';

class CheckAuthorizationScreen extends StatelessWidget {
  const CheckAuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const CustomerHomeMenuScreen();
          }
          else{
            return const ChooseAuthScreen();
          }
        }
      ),
    );
  }
}
