/// Flexible and Expanded both are similar
/// But some changes in Flexible is that it has fit: FlexFit.tight / FlexFit.loose (it is not too much use in flutter except some rare case)

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
      body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(color: Colors.orangeAccent,)
              ),
              Expanded(
                  flex: 4,
                  child: Container(color: Colors.green,)
              ),
              Expanded(
                flex: 3,
                  child: Container(color: Colors.red,)
              ),
              Expanded(
                flex: 1,
                  child: Container(color: Colors.pinkAccent,)
              ),
            ],
          ),
        )

    );
  }
}
