import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbyhasan/CounterController.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn GetX 1st Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
            ElevatedButton(
                onPressed: () {
                  counterController.addMethod();
                },
                child: const Text('Plus')),
            ElevatedButton(
                onPressed: () {
                  counterController.minusMethod();
                },
                child: const Text('Minus')),
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
            ElevatedButton(
                onPressed: () {
                  Get.to(SecondScreen());
                },
                child: const Text('Goto Second Screen')),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn GetX 2nd Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
            ElevatedButton(
                onPressed: () {
                  counterController.addMethod();
                },
                child: const Text('Plus')),
            ElevatedButton(
                onPressed: () {
                  counterController.minusMethod();
                },
                child: const Text('Minus')),
            GetBuilder<CounterController>(builder: (counterController) {
              return Text(counterController.count.toString());
            }),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Back Screen'))
          ],
        ),
      ),
    );
  }
}
