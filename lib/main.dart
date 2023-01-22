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
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppsHome()));
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
        backgroundColor: Colors.black,
        title: Text('Meal App'),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 13,
      ),

      /// Body
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Join a Meal Service',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)

          ],

        ),
      ),


      /// floating action button
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchMealService()));
        },

        backgroundColor: Colors.black,
        hoverColor: Colors.blueGrey,
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
          TextButton(onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeEntryPage()), (route) => false);
          }, child: Text('No')),
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
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
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
              width: 300,
              margin: EdgeInsets.all(30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black
                    ),
                    onPressed: (){
                      _navigateToNextScreen(context);

                }, child: Icon(Icons.arrow_circle_right,size: 25)))
          ],
        ),
      ),
    );
  }
}

class SearchMealService extends StatelessWidget {
  SearchMealService({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller1,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Enter Country';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Country',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller2,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'Enter Country';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: (){
                var value1 = controller1.text;
                var value2 = controller2.text;
                Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>AvailableMealServices(value1:value1,value2:value2)));
              }, child: Text('Go'))
        ],
      ),
    );
  }
}

class AvailableMealServices extends StatelessWidget {
  var value1;
  var value2;
  AvailableMealServices({required this.value1, required this.value2, Key? key}) : super(key: key);

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
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Pangkha Catering Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Khabar Meal Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Gor Meal Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Khabab Meal Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Panshi Home Meal Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Rujina Home Meal Service'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Meal Amberkhana'),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: true, groupValue: 'AvailableMeal', onChanged: (value) {}),
                Text('Amar Khabar Meal Service'),
              ],
            ),
            Container(
                height: 40,
                width: 350,
                margin: EdgeInsets.all(30),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      //_navigateToNextScreen(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: Icon(Icons.arrow_circle_right, size: 25)))
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Meal Members',style: TextStyle(fontSize: 27),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('My Meal',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('My Monthly Account',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Todays Bazar',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Current Month Bazar',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Todays Meal Update',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Current Month Meal Update',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              width: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MembersPage()));

                  }, child: Text('Total Monthly Account',style: TextStyle(fontSize: 20),)),
                ),
              ),
            ),
          ],

        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_sharp), label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more), label: 'Read more')
        ],
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
                //SnackBarMessage('My Profile', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              hoverColor: Colors.grey,
              onTap: () {
                //SnackBarMessage('Goto Home', context);
              },
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Contact with Manager'),
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactWithManager()));
              },
            ),
            ListTile(
              leading: Icon(Icons.report_gmailerrorred_outlined),
              title: Text('Report to Manager'),
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ReportManager()));
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('About'),
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MembersPage extends StatelessWidget {
  const MembersPage({Key? key}) : super(key: key);

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
    );
  }
}


class ContactWithManager extends StatelessWidget {
  const ContactWithManager({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                  child:
                  Center(
                      child: Text('Call : 01716-874981',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.green),))),
            ],
          ),
        ],
      ),
    );
  }
}

class ReportManager extends StatelessWidget {
  const ReportManager({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red)
            ),
            alignment: Alignment.center,
            width: 400,
            height: 100,
            child: Text('If you are face any problem with our service please tell us\nby this\n\nE-mail : MessManager01@gmail.com',textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);

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
      Center(
        child: Container(
          alignment: Alignment.center,
          height: 250,
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 200),
          //color: Colors.red,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This Software is made for Meal Service app which developed by Hasan Ahmad from Bangladesh.\n\n\n\nFor contact:\n\nCall: (+880) 1716-874981\nE-mail:hasanahmad9812021@gmail.com',textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.normal),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
