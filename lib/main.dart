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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  TextEditingController controller8 = TextEditingController();
  TextEditingController controller9 = TextEditingController();
  TextEditingController controller10 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cover Page'),
        toolbarHeight: 85,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller1,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller2,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller3,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Course Code',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller4,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Course Title',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller5,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Batch-(section)',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller6,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'Department',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: Container(
              child: TextFormField(
                controller: controller7,
                onChanged: (value) {},
                onTap: () {},
                onSaved: (value) {},
                decoration: InputDecoration(
                  hintText: 'University Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            print(controller1.text);
            print(controller2.text);
            print(controller3.text);
            print(controller4.text);
            print(controller5.text);
            print(controller6.text);
            print(controller7.text);
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 8,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,

                )
              ),
              child: Text('Submit'))
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                decoration:BoxDecoration(color:Colors.brown),
                accountName: Text('Developed by Hasan'),
                accountEmail: Text('Hasan Ahmad'),
            )),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('(+880) 1716-874981'),
              hoverColor: Colors.grey,
              onTap: () {

              },

            ),
            ListTile(
              leading: Icon(Icons.question_mark_outlined),
              title: Text('About'),
              subtitle: Text(''),
              hoverColor: Colors.grey,
              onTap: () {

              },

            )
          ],
        ),
      ),
    );
  }
}
