/* lifecycle of StatefulWidget in this code
 1. Create state
 2. Init state
 3. didChangeDependencies()
 4. build()
 5. setState()
 6. didUpdateWidget()
 7. deactivated()
 8. dispose()
 9. mounted()
*/

import 'package:flutter/material.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
          },
          child: Text('Second Page'),
        ),
      ),
    );
  }
}


class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  /// statrting life cycle

  /// Step : 01
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String text = 'Hi';
  int times = 0;

  /// Step : 02
  @override
  void initState() {
    print('Initstate called');
    super.initState();
  }

  /// Step : 03
  @override
  void didChangeDependencies() {
    print('didChangeDependencies called');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SecondPage oldWidget) {
    print('didUpdateWidget called');
    super.didUpdateWidget(oldWidget);
  }

  /// Step : 04
  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8,
        child: Icon(Icons.add),
        onPressed: (){
          text = 'Hello World';
          times++;
          //print(text);
          /// Step : 05
          setState(() {    // it is use for re-render the build function and change the screen's state
            print('setState called');
          });
        },
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$text\t'),
            Text(times.toString()),
          ],
        ),
      ),
    );
  }


  // This two method is possible when present at least 2 screen in Stack
  /// And these are 'last 2 step' of StatefulWidget Lifecycle
  @override
  void deactivate() {
    print('deactive called');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose called');
    super.dispose();
  }
}