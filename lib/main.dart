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
        title: const Text('Date Range'),
        actions: [
          IconButton(onPressed: () async{

            /// Date range
            final rangeDate = await showDateRangePicker(context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2030));
            print(rangeDate);

          }, icon: const Icon(Icons.date_range))
        ],
      ),
    );
  }
}