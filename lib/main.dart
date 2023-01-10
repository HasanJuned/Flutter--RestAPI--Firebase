import 'dart:ui';

import 'package:flutter/material.dart';

main() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewTwo()));
                }, child: Text('Click for List view page')),
          ],
        ),
      ),
    );
  }
}

class ListViewTwo extends StatelessWidget {
  ListViewTwo({Key? key}) : super(key: key);


  /// Json Data for routing when click on the image in List View
  var Routing = [
    {'routePage':Members()},
    {'routePage':MyMeal()},
    {'routePage':MyAccount()},
    {'routePage':TodaysBazar()},
    {'routePage':CurrentMonthBazarReport()},
    {'routePage':TodaysMealReport()},
    {'routePage':CurrentMonthMealReport()},
    {'routePage':MonthlyAccountsReport()},
  ];


  /// Json data used to set the data for accessing dynamically in the List view
  var ListItems = [
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.0OEV4fG5oQLTxmsHMYxj9wHaE8&pid=Api&P=0',
      'title': 'Members'
    },
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.j_NOuF0uzbiz4vCuNZSYHgHaE8&pid=Api&P=0',
      'title': 'My Meal'
    },
    {
      'image':
      'https://tse2.mm.bing.net/th?id=OIP.qnGQP5dDfNYShRLc3pseZgHaE8&pid=Api&P=0',
      'title': 'My Monthly Account Report'
    },
    {
      'image':
      'https://tse4.mm.bing.net/th?id=OIP.N0zjhirTnY4vPhTLmUQqwwHaE7&pid=Api&P=0',
      'title': 'Todays Bazar'
    },
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.3l8g-bt0nCQcexpx5CVhDAHaE6&pid=Api&P=0',
      'title': 'Current Month Bazar Report'
    },
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.83zGw1zjBlMeNp3TOvzSdwHaE8&pid=Api&P=0',
      'title': 'Todays Meal Report'
    },
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.k8FUKCiuicKLPRO-uLBRcgHaE8&pid=Api&P=0',
      'title': 'Current Month Meal Report'
    },
    {
      'image':
      'https://tse3.mm.bing.net/th?id=OIP.I6UFUD6CQU2dujDGixgwIQHaE7&pid=Api&P=0',
      'title': 'Total Monthly Account Report'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.black,
      ),

      body:
      Scrollbar(
        thickness: 7,
        radius: Radius.circular(30),
        child: ListView.separated(
          itemCount: ListItems.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Routing[index]['routePage']!));

              },
              child:
              Column(
                children: [
                  Text(ListItems[index]['title']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white,backgroundColor: Colors.deepPurple),),
                  Container(
                    height: 190,
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child:
                    Image.network(ListItems[index]['image']!,fit: BoxFit.fill,),

                  ),
                ],
              ),
            );

          },
          separatorBuilder: (context,index){
            return Divider(
              height: 40,
              thickness: 3,
              color: Colors.blueGrey.shade200
              ,
            );

          },

        ),
      ),
    );
  }
}

class Members extends StatelessWidget {
  Members({Key? key}) : super(key: key);

  var MembersList = [
    {'member':'Hasan'},
    {'member':'Rahat'},
    {'member':'Sammun'},
    {'member':'Sayem'},
    {'member':'Jawad'},
    {'member':'Shakib'},
    {'member':'Shanto'},
    {'member':'Rana'},
    {'member':'Kohinoor'},
    {'member':'Jamshed'},
    {'member':'Hasan'},
    {'member':'Rahat'},
    {'member':'Sammun'},
    {'member':'Sayem'},
    {'member':'Jawad'},
    {'member':'Shakib'},
    {'member':'Shanto'},
    {'member':'Rana'},
    {'member':'Kohinoor'},
    {'member':'Jamshed'},
    {'member':'Hasan'},
    {'member':'Rahat'},
    {'member':'Sammun'},
    {'member':'Sayem'},
    {'member':'Jawad'},
    {'member':'Shakib'},
    {'member':'Shanto'},
    {'member':'Rana'},
    {'member':'Kohinoor'},
    {'member':'Jamshed'},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
        backgroundColor: Colors.black,
      ),
      body:
      Scrollbar(
        radius: Radius.circular(20),
        thickness: 6,
        child: ListView.separated(
            itemCount: MembersList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                  },
                  child:
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 9,horizontal: 15),
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_rounded),
                      tileColor: Colors.blueGrey.shade200,
                      title: Text(MembersList[index]['member']!),
                      subtitle: Text('Member'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Icon(Icons.person),
                        //backgroundColor: ,
                      ),
                    ),
                  )
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 3,
                height: 10,
                color: Colors.indigo.shade100,
              );
            }),
      ),
    );
  }
}
class MyMeal extends StatelessWidget {
  const MyMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meal'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse1.mm.bing.net/th?id=OIP.KrNb8nkzUtP0Eeh5S7zr7gHaFu&pid=Api&P=0'),
      ),
    );
  }
}
class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse2.mm.bing.net/th?id=OIP.O6ZrINksshP955zkHwmRIwHaFQ&pid=Api&P=0'),
      ),
    );
  }
}
class TodaysBazar extends StatelessWidget {
  const TodaysBazar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todays Bazar'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Todays Bazar Page'),
      ),
    );
  }
}
class CurrentMonthBazarReport extends StatelessWidget {
  const CurrentMonthBazarReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Month Bazar'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse2.mm.bing.net/th?id=OIP.O6ZrINksshP955zkHwmRIwHaFQ&pid=Api&P=0'),
      ),
    );
  }
}
class TodaysMealReport extends StatelessWidget {
  const TodaysMealReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todays Meal Report'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse1.mm.bing.net/th?id=OIP.rmu8iEpSxP3GgnrnYtEDtAHaFn&pid=Api&P=0'),
      ),
    );
  }
}
class CurrentMonthMealReport extends StatelessWidget {
  const CurrentMonthMealReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Months Meal Report'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse2.mm.bing.net/th?id=OIP.O6ZrINksshP955zkHwmRIwHaFQ&pid=Api&P=0'),
      ),
    );
  }
}
class MonthlyAccountsReport extends StatelessWidget {
  const MonthlyAccountsReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Accounts Report'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse2.mm.bing.net/th?id=OIP.O6ZrINksshP955zkHwmRIwHaFQ&pid=Api&P=0'),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body:
      Center(
        child : Text('Members Profile'),
      ),
    );
  }
}
class YourMeal extends StatelessWidget {
  const YourMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Meal'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network('https://tse2.mm.bing.net/th?id=OIP.O6ZrINksshP955zkHwmRIwHaFQ&pid=Api&P=0'),
      ),
    );
  }
}