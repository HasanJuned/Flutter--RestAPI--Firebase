import 'dart:ui';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

   Size size =  MediaQuery.of(context).size;
   print(size.height);
   print(size.width);
   print(size.aspectRatio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
