import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  final Client httpClient = Client();/// it is abstract class for request to APi

  Future<void> getProductListFromApi() async{

    /// request to APi
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await httpClient.get(uri);
    print(response.statusCode);
    print(jsonDecode(response.body));

  }
  @override
  void initState() {
    super.initState();
    getProductListFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return const ListTile(
              title: Text('Asus VivoBook'),
              subtitle: Text('Quantity : 20'),
              trailing: Text('Total : 20000'),
              leading: Text('200 / Unit'),
              //tileColor: Colors.grey,
            );
          }
      ),
    );
  }
}

