import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // TextEditingController controller = TextEditingController();
  //
  // List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
            context: (context),
            backgroundColor: Colors.blueGrey,
            barrierColor: Colors.black87,
            isScrollControlled: true,
            isDismissible: true,
            enableDrag: true,
            builder: (builder) {
              return SizedBox(
                height: 300,
                child: Column(
                  children: [
                   const TextField(
                      //controller: controller,
                    ),
                    ElevatedButton(onPressed: (){
                      // todos.add(controller.text);
                      // todos.clear();
                      // setState(() {});
                      // Navigator.pop(context);
                    }, child: const Text('ADD'))
                  ],
                ),
              );
            }
            );
      },child: const Icon(Icons.add),),
    );
  }
}

