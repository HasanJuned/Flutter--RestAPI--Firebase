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

      /// Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          /// Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.black,
                elevation: 25,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )
            ),
            onPressed: (){
              SnackBarMessage('Tap me', context);
            },
            child: Text('Tap me'),
          )
        ],
      ),

    );
  }
}
