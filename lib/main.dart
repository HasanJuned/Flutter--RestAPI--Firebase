import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Picker'),
        actions: [
          IconButton(onPressed: () async{

            ///Time picker
            final timePicker = await showTimePicker(context: context,
                initialTime: TimeOfDay.now());
            print(timePicker);

          }, icon: const Icon(Icons.watch_later_outlined))
        ],
      ),
    );
  }
}