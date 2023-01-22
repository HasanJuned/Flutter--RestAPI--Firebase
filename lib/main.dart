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
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            /// Container
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(20),
              //color: Colors.redAccent,
              child: Text('This is Container', style: TextStyle(fontSize: 24)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.greenAccent, width: 5),
                color: Colors.redAccent,
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(value: false, groupValue: 'Gender', onChanged: (value){}),
                Text('Male'),
                Radio(value: true, groupValue: 'Gender', onChanged: (value){}),
                Text('Female'),
                Radio(value: true, groupValue: 'Gender', onChanged: (value){}),
                Text('Others')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: true, onChanged: (value){}),
                Text('Student'),
                Checkbox(value: false, onChanged: (value){}),
                Text('Job holder'),
                Checkbox(value: false, onChanged: (value){}),
                Text('IELTS Student'),
              ],
            ),

            /// Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.black,
                  elevation: 25,
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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
            ),

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
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value!.isEmpty)
                    {
                      return 'Enter your password';
                    }
                  return null;
                },
                obscureText: true,
                controller: controllerTwo,
                onChanged: (value){
                  //print(value);
                },
                // onSubmitted: (value){
                //   //print(value);
                // },
                onTap: (){
                  //SnackBarMessage('Pressed', context);
                },
                decoration: InputDecoration(
                  hintText: 'Password',
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
                  MyAlertDialague(context);
                },
                child: Text('Sign in')),
          ],

        ),
      ),



      /// floating action button
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: Icon(Icons.camera_alt_outlined),
        onPressed: () {
          SnackBarMessage('This is Camera action', context);
        },
        backgroundColor: Colors.blueAccent,
        hoverColor: Colors.blueGrey,
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
            //SnackBarMessage('See Notifications', context);
            /// Routing
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
          }
          if (index == 1) {
            SnackBarMessage('Goto Home', context);
          }
          if (index == 2) {
            //SnackBarMessage('Read  more', context);
            /// Routing
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReadMorePage()));
          }
        },
      ),

      /// Navigation Drawer
      drawer: Drawer(
        //backgroundColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))
        ),
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueGrey),
                  accountName: Text('Mess Name', style: TextStyle(color: Colors.white),),
                  accountEmail: Text('messSylhet2023@gmail.com', style: TextStyle(color: Colors.white)),
                  currentAccountPicture: Image.network('https://cdn0.iconfinder.com/data/icons/education-school-science/100/29-512.png'),
                  //currentAccountPictureSize: Size.square(150),
                )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              hoverColor: Colors.grey,
              onTap: () {
                SnackBarMessage('My Profile', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              hoverColor: Colors.grey,
              onTap: () {
                SnackBarMessage('Goto Home', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Contact with Manager'),
              hoverColor: Colors.grey,
              onTap: () {
                SnackBarMessage('Call to Manager', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.report_gmailerrorred_outlined),
              title: Text('Report to Manager'),
              hoverColor: Colors.grey,
              onTap: () {
                SnackBarMessage('Report to Manager', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('About'),
              hoverColor: Colors.grey,
              onTap: () {
                SnackBarMessage('About Us', context);
              },
            ),
          ],
        ),
      ),

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
            }, child: Text('Back')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingPage())); /// return a data to another page (return to video page)
            }, child: Text('Goto Loading page'))
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  /// in this class here used
  /// Circular progress
  /// Linear progress
  /// Circular avatar (most use for profile pic)
  /// ListTile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Page'),
        centerTitle: true,
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
                strokeWidth: 8,
                backgroundColor: Colors.black45,
                /// value: 0.8,
                /// valueColor: Colors.red,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child:
              SizedBox(
                width: 300,
                child: LinearProgressIndicator(
                  minHeight: 18,
                  color: Colors.red,
                  backgroundColor: Colors.pink.shade50,
                  value: .3,

                ),
              )
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.deepPurple,
            backgroundImage: NetworkImage('https://assets.change.org/photos/1/hc/ru/ChhcRUUJnEWDtth-1600x900-noPad.jpg?1516317148'),
            //child: Icon(Icons.icecream,size: 65,),

          ),
          ListTile(
            title: Text('Hasan Ahmad'),
            subtitle: Text('Student'),
            tileColor: Colors.blueGrey,
            leading: 
            CircleAvatar(
                child: Text('01')
            ),
            trailing: Icon(Icons.person),
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Short pressed'))
              );
            },
            onLongPress: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Long pressed'))
              );
            },
          ),
        ],
      ),
    );
  }
}

