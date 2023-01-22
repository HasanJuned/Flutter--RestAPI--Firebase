/// push -> route to next page
/// pop -> back previous page
/// pushReplacement -> Replace current page
/// pushAndRemoveUntil -> REMOVE ALL PREVIOUS PAGE EXCEPT THE LAST PAGE

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
  AppsHome({Key? key}) : super(key: key);

  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();
  TextEditingController controllerThree = TextEditingController();
  TextEditingController controllerFour = TextEditingController();
  TextEditingController controllerFive = TextEditingController();

  /// SnackBar message code
  SnackBarMessage(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }
  /// Alert Dialgue
  MyAlertDialague(context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure for submission?'),
        actions: [
          TextButton(onPressed: (){}, child: Text('No')),
          TextButton(onPressed: (){SnackBarMessage('message', context);}, child: Text('Yes')),
        ],
      );
    }
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: AppBar(

        /// appBar
        title: Text("Home Page"),
        //titleSpacing: 15,
        centerTitle: true,
        toolbarOpacity: 1,
        elevation: 15,
        backgroundColor: Colors.blueAccent,

        /// set action icon in appbar
        actions: [
          IconButton(
            onPressed: () {
              SnackBarMessage('Search', context);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),

      /// Body
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
            }, child: Text('Goto Notification Page')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadMorePage()));
            }, child: Text('Goto Read more Page')),
          ],
        ),
      )

    );
  }
}

/// push -> route to next page
/// pop -> back previous page
/// pushReplacement -> Replace current page
/// pushAndRemoveUntil -> REMOVE ALL PREVIOUS PAGE EXCEPT THE LAST PAGE

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
        centerTitle: true,
      ),
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              /// Routing to Contact page and all pages will be vanished
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ContactUsPage()),
                      (route) => false);

            }, child: Text('Goto Contact Us page')),
            ElevatedButton(onPressed: (){
              Navigator.pop(context); /// Back to previous page
            }, child: Text('Back Homepage')),
          ],
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Contact Us page'),
            ElevatedButton(onPressed: (){
              Navigator.pop(context); /* --> */ /// pressing this button but don't go back to previous page because of previous all pages are vanished
                                                /// Use case example: Normally it is Used in Login / Registration page
            }, child: Text('Back page'))
          ],
        ),
      ),
    );
  }
}

class ReadMorePage extends StatelessWidget {
  ReadMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Readmore Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              /// Routing to next page
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> VideoPage(name: '50 Taka from previous page',)));
            }, child: Text('Goto video page')),
            ElevatedButton(onPressed: (){
              Navigator.pop(context); /// Back previous page
            }, child: Text('Back page'))
          ],
        )
      ),
    );
  }
}

class VideoPage extends StatelessWidget {
  String name; /// Reciving data from another page / Passing data from one to another page through Constructor
  VideoPage({required this.name,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name), /// This is that data which is passed from other page

            ElevatedButton(onPressed: () async { /// returned data, from another page (from Image page)
             var value = await Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage(name: name)));
             print(value);
            }, child: Text('Goto Image Page')),
            ElevatedButton(onPressed: (){
              Navigator.pop(context); /// back to previous page
            }, child: Text('Back'))
          ],
        ),
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  String name;
  ImagePage({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            ElevatedButton(onPressed: (){
              Navigator.pop(context,'50 Taka back from Image page'); /// return a data to another page (return to video page)
            }, child: Text('Back'))
          ],
        ),
      ),
    );
  }
}
