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

          /// Simple form
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: controllerOne,
              onChanged: (value){
                //print(value);
              },
              onSubmitted: (value){
                //print(value);
              },
              onTap: (){
                //SnackBarMessage('Pressed', context);
              },
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            //margin: EdgeInsets.all(10),
            //color: Colors.red,
            child: TextField(
              controller: controllerTwo,
              onChanged: (value){
                //print(value);
              },
              onSubmitted: (value){
                //print(value);
              },
              onTap: (){
                //SnackBarMessage('Pressed', context);
              },
              decoration: InputDecoration(
                hintText: 'Enter your age',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.black87,
                  elevation: 8,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              onPressed: () {
                print(controllerOne.text);
                print(controllerTwo.text);
                //controllerOne.text = 'hassan';
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Confirmation'),
                    content: Text('Are you sure for submission?'),
                    actions: [
                      TextButton(onPressed: (){}, child: Text('No')),
                      TextButton(onPressed: (){}, child: Text('Yes')),
                    ],
                  );
                });
              },
              child: Text('Sign in')),
        ],

      ),


    );
  }
}
