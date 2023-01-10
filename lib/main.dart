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
      home: HomeEntryPage(),
    );
  }
}

class HomeEntryPage extends StatelessWidget {
  HomeEntryPage({Key? key}) : super(key: key);

  void _navigateToNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Meal Service App',style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 5)
              ),
              child: Image.network('https://cdn0.iconfinder.com/data/icons/education-school-science/100/29-512.png'),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    _navigateToNextScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    elevation: 18,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontStyle: FontStyle.italic
                    )
                  ),
                      child: Text('Register')),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  void _navigateToNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
  }

  ConfirmationAlertBox(context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure for submit'),
        actions: [
          TextButton(onPressed: (){}, child: Text('No')),
          TextButton(onPressed: (){
            _navigateToNextScreen(context);
          }, child: Text('Yes')),
        ],
      );
    }
    );
  }

  TextEditingController controller0 = TextEditingController();
  TextEditingController controller00 = TextEditingController();
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
        backgroundColor: Colors.black,
        title: Text('Meal App'),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 13,
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Username';
                      }
                      return null;
                    },
                    controller: controller0,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Password';
                      }
                      return null;
                    },
                    controller: controller00,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter your name';
                      }
                      return null;
                    },
                    controller: controller1,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Enter Your Full Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your Date of Birth';
                      }
                      return null;
                    },
                    controller: controller2,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'DD-MM-YYYY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your Upazila';
                      }
                      return null;
                    },
                    controller: controller3,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Upazila',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your Hometown City';
                      }
                      return null;
                    },
                    controller: controller4,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Which Day You Admit';
                      }
                      return null;
                    },
                    controller: controller5,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Entry Date (DD-MM-YYYY)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Your Number';
                      }
                      return null;
                    },
                    controller: controller6,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Your Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Enter Gurdian Number';
                      }
                      return null;
                    },
                    controller: controller7,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Gurdian Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),Container(
                color: Colors.black12,
                margin: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: Container(
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Your Profession';
                      }
                      return null;
                    },
                    controller: controller8,
                    onChanged: (value) {},
                    onTap: () {},
                    onSaved: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Student / Job holder / IELTS Student',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                print(controller0.text);
                print(controller00.text);
                print(controller1.text);
                print(controller2.text);
                print(controller3.text);
                print(controller4.text);
                print(controller5.text);
                print(controller6.text);
                print(controller7.text);
                print(controller8.text);

                ConfirmationAlertBox(context);
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 8,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,

                      )
                  ),
                  child: Text('Submit')),
            ],
          ),
        ),
      ),

    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  void _navigateToNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppsHome()));
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Meal App'),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 13,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        //padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value){
                  if(value!.isEmpty){
                    return 'Username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Username', border: OutlineInputBorder()),
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Password';
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password', border: OutlineInputBorder()),
            ),
            Container(
              height: 40,
              width: 80,
              margin: EdgeInsets.all(30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                    ),
                    onPressed: (){
                      _navigateToNextScreen(context);

                }, child: Icon(Icons.arrow_circle_right,size: 28)))
          ],
        ),
      ),
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
      body: Column(
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
