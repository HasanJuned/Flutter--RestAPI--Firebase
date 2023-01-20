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

  ConfirmationAlertBox(context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure for submit'),
        actions: [
          TextButton(onPressed: (){}, child: Text('No')),
          TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrintPage(
                                name: controller1.text,
                                id: controller2.text,
                                courseCode: controller3.text,
                                courseTitle: controller4.text,
                                batch: controller5.text,
                                department: controller6.text,
                                versity: controller7.text)));
                  },
                  child: Text('Yes')),
            ],
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cover Page'),
        toolbarHeight: 85,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Container(
                child: TextFormField(
                  controller: controller1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Name';
                    }
                    return null;
                  },
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'ID / Roll';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Course Code';
                    }
                    return null;
                  },
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Course Title';
                    }
                    return null;
                  },
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Batch / Section';
                    }
                    return null;
                  },
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Department';
                    }
                    return null;
                  },
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'Versity / College';
                    }
                    return null;
                  },
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

      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
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

class PrintPage extends StatelessWidget {
  String? name;
  String? id;
  String? courseCode;
  String? courseTitle;
  String? batch;
  String? department;
  String? versity;
  PrintPage({
    required this.name,
    required this.id,
    required this.courseCode,
    required this.courseTitle,
    required this.batch,
    required this.department,
    required this.versity,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Cover Page'),
        backgroundColor: Colors.black,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Container(
              //color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 20),
              //height: 300,
              width: double.infinity,
              child: SingleChildScrollView(
                child:
                Container(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.grey.shade400
                        ),
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Text('   Submitted to   ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.grey.shade400
                        ),
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Text('   Submitted by   ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Name              :  $name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('ID                     :  $id',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Course Code  :  $courseCode',style: TextStyle(fontSize: 15))
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Course Title       :  $courseTitle',style: TextStyle(fontSize: 13))
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Section           :  $batch',style: TextStyle(fontSize: 15))
                      ),
                      SizedBox(
                          height:29,
                          width: double.infinity,
                          child: Text('Department   :  $department',style: TextStyle(fontSize: 15))
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
