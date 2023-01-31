import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:softbyhasan/ProductListModel.dart';

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
  ProductListModel productListModel = ProductListModel();
  bool dataLoadingInProgress = false;

  Future<void> getProductListFromApi() async{

    dataLoadingInProgress = true;
    setState(() {});
    /// request to APi
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
    Response response = await httpClient.get(uri);
    // print(response.statusCode);
    // print(jsonDecode(response.body));
    productListModel = ProductListModel.fromJson(jsonDecode(response.body));
    print(productListModel.status);
    print(productListModel.productList?.length ?? 0);
    dataLoadingInProgress = false;
    setState(() {});

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
        title: const Text('Product List'),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          getProductListFromApi();
        },
        child: dataLoadingInProgress ? const Center(
          child: CircularProgressIndicator(),
        ): ListView.builder(
            itemCount: productListModel.productList?.length ?? 0,
            itemBuilder: (context,index){
              return ListTile(
                title:
                    Text(productListModel.productList?[index].title ?? 'Unknown'),
                subtitle:
                    Text('Brand : ${productListModel.productList?[index].brand}'),
                trailing:
                    Text('Star : ${productListModel.productList?[index].star}'),
                leading:
                    Text('${productListModel.productList?[index].price} / Unit'),
                //tileColor: Colors.grey,
              );
            }
        ),
      ),
    );
  }
}

