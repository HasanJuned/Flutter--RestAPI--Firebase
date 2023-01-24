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
      body:
        Center(
          child:
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingPage()));
          }, child: Text('Goto List Tile Page')),
        )

    );
  }
}

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Tile Page'),
        centerTitle: true,
      ),

      /// ListTile and Avatar-> (We can create profile picture by using it)
      body:
      Center(
        child:
        ListTile(
          title: Text('Hasan Ahmad'),
          subtitle: Text('Flutter Developer'),
          leading:
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage('https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png'),
            //child: Icon(Icons.icecream),
          ),
          tileColor: Colors.grey,
          trailing: Icon(Icons.person),
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tap'))
            );
          },
          onLongPress: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Long pressed'))
            );
          },
        )
      ),
    );
  }
}

