/// By LayoutBuilder we can handle our widget in multiple screen
/// MediaQuery -> LayoutBuilder

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

   // Size size =  MediaQuery.of(context).size;
   // print(size.height);
   // print(size.width);
   // print(size.aspectRatio);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(
          builder: (context, constraints){
            print(constraints.maxWidth);
            print(constraints.minWidth);
            print(constraints.maxHeight);
            print(constraints.minHeight);

            if(constraints.maxWidth<600){
              return Container(
                height: 200,
                width: 200,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text('Mobile view'),
              );
            }
            else if(constraints.maxWidth<1000){
              return Container(
                height: 200,
                width: 200,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text('Tablet view'),
              );
            }
            else if(constraints.maxWidth<1500){
              return Container(
                height: 200,
                width: 200,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text('Desktop view'),
              );
            }
            else{
              return Container(
                height: 200,
                width: 200,
                color: Colors.yellowAccent,
                alignment: Alignment.center,
                child: Text('Large screen view'),
              );
            }



            // return Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         // Text('Max Width : ${constraints.maxWidth.toString()}'),
            //         // Text('Min Width : ${constraints.minWidth.toString()}'),
            //         // Text('Max Height : ${constraints.maxHeight.toString()}'),
            //         // Text('Min Height : ${constraints.minHeight.toString()}'),
            //       ],
            //     ));




          }),
    );
  }
}
