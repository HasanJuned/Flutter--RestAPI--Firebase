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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewOne()));
            }, child: Text('ListView Class 01')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey
                ),
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListViewTwo()));
            }, child: Text('ListView Class 02')),
          ],
        ),
      ),
    );
  }
}

class ListViewOne extends StatelessWidget {
  const ListViewOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class 01'),
        backgroundColor: Colors.black,
      ),
      body:
      Scrollbar(
        thickness: 10,
        radius: Radius.circular(30),
        //thumbVisibility: true,
        child:
        ListView.separated(
          //scrollDirection: Axis.horizontal, // try this one
          scrollDirection: Axis.vertical,
          // reverse: true, // most use in chat
          itemCount: 100,
          itemBuilder: (context,index){
            return
              Column(
                children: [
                  Text('Hasan $index'),
                ],
              );
          },
          separatorBuilder: (context,index){
            return Divider(
              thickness: 5,
              color: Colors.purpleAccent.shade100,
              height: 35,
            );
          },
        ),
      ),
    );
  }
}

class ListViewTwo extends StatelessWidget {
  ListViewTwo({Key? key}) : super(key: key);

  /// Json Data for routing when click on the image in List View
  var Routing = [
    {'title':Members()},
    {'title':MyMeal()},
    {'title':MyAccount()},
    {'title':TodaysBazar()},
    {'title':CurrentMonthBazarReport()},
    {'title':TodaysMealReport()},
    {'title':CurrentMonthMealReport()},
    {'title':MonthlyAccountsReport()},
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
        title: Text('Class 02'),
          backgroundColor: Colors.black,
    ),

    body:
    ListView.separated(
    itemCount: ListItems.length,
    itemBuilder: (context,index){
    return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Routing[index]['title']!));

    },
    child:
    Column(
      children: [
        Text(ListItems[index]['title']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white,backgroundColor: Colors.deepPurple),),
        Container(
        height: 220,
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
    );
  }
}

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Members Page'),
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
        child: Text('My Meal Page'),
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
        child: Text('My Account Page'),
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
        child: Text('Current Month Bazar Report Page'),
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
        child: Text('Todays Meal Report Page'),
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
        child: Text('Current Month Meal Report Page'),
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
        child: Text('Total Account Report Page'),
      ),
    );
  }
}




