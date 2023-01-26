import 'package:flutter/material.dart';
import 'package:get/get.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            ElevatedButton(onPressed: (){
              Get.to(const SecondScreen()); /// --> for route to next screen (Navigator.push)
            }, child: const Text('Goto Second Screen')),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
            ElevatedButton(onPressed: (){
              Get.back(); /// --> for route to Back screen (Navigator.pop)
            }, child: const Text('Back 1st Screen')),
            ElevatedButton(onPressed: (){
              Get.to(const ThirdScreen());
            }, child: const Text('Goto Third Screen')),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

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
            ElevatedButton(onPressed: (){
              Get.back(); /// --> for route to Back screen (Navigator.pop)
            }, child: const Text('Back 2nd Screen')),
            ElevatedButton(onPressed: (){

              //Get.off('screen name'); /// (Navigator.Replace)

              Get.offAll(const HomePage(), predicate: (route) => false); /// --> (Navigator.pushAndRemoveUntil)
            }, child: const Text('Goto First Screen')),
          ],
        ),
      ),
    );
  }
}
