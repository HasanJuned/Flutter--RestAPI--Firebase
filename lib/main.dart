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

    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Tab Bar View'),
            backgroundColor: Colors.black,
            bottom: TabBar(
              isScrollable: true,
               // indicatorColor: Colors.red,
                indicatorWeight: 4,
                // indicator: BoxDecoration(
                //   //borderRadius: BorderRadius.circular(2),
                //   border: Border.all(color: Colors.brown),
                //   color: Colors.red
                // ),
              unselectedLabelColor: Colors.blueGrey,
                labelColor: Colors.blue,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                ),
                tabs: [
                  Tab(
                    text: 'Camera',
                  ),
                  Tab(
                    text: 'Chats',
                  ),
                  Tab(
                    text: 'Status',
                  ),
                  Tab(
                    text: 'Groups',
                  ),
                  Tab(
                    text: 'Call log',
                  ),
                  Tab(
                    text: 'Contact',
                  ),
                ],
            ),
          ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Camera'),
            ),
            Center(
              child: Text('Chats'),
            ),
            Center(
              child: Text('Status'),
            ),
            Center(
              child: Text('Groups'),
            ),
            Center(
              child: Text('Call log'),
            ),
            Center(
              child: Text('Contatct'),
            ),
          ],

        ),
      ),
    );
  }
}