import 'package:flutter/material.dart';


/// This is practise file not mandatory
main() {
  runApp(HelloWorldApp());
}

/// converting a class into widgets so inherits the StatelessWidget
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 8,
          title: Text('Hasan App'),
        ),
        body: Text('Hey I am Hasan Ahmad. This is my new flutter app project'),
      ),
    );
  }
}