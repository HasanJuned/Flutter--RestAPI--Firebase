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

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: .4,
          widthFactor: .3,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),

    );
  }
}
