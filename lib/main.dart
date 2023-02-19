import 'package:flutter/material.dart';
import 'package:softbyhasan/ui/screens/SplashScreen.dart';

main(){
  runApp(const TaskManager());
}

class TaskManager extends StatelessWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
