import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppsHome(),
    );
  }
}

class AppsHome extends StatelessWidget {
  const AppsHome({Key? key}) : super(key: key);

  /// SnackBar message code
  SnackBarMessage(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: AppBar(
        /// appBar
        title: Text("Mess App"),
        //titleSpacing: 15,
        centerTitle: true,
        toolbarOpacity: 1,
        toolbarHeight: 85,
        elevation: 25,
        backgroundColor: Colors.blueAccent,

        /// set action icon in appbar
        actions: [
          IconButton(
            onPressed: () {
              SnackBarMessage('Search', context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                SnackBarMessage('Call', context);
              },
              icon: Icon(Icons.add_call)),
          IconButton(
              onPressed: () {
                SnackBarMessage('Settings', context);
              },
              icon: Icon(Icons.settings_applications))
        ],
      ),

      /// bottom navigation bar / tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedFontSize: 18,
        unselectedFontSize: 8,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_sharp), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more), label: 'Read more')
        ],
        onTap: (int index) {
          if (index == 0) {
            SnackBarMessage('See Notifications', context);
          }
          if (index == 1) {
            SnackBarMessage('Goto Home', context);
          }
          if (index == 2) {
            SnackBarMessage('Read  more', context);
          }
        },
      ),


    );
  }
}
