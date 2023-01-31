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

      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewProduct()));
          }, child: Icon(Icons.add),),
      
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

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Client httpClient = Client();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productQuantityController = TextEditingController();
  final TextEditingController productUnitPriceController = TextEditingController();
  final TextEditingController productTotalPriceController = TextEditingController();
  final TextEditingController productImageController = TextEditingController();
  
  Future<void> addnewProduct() async{
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Response response = await httpClient.post(
        uri,
        headers: {
          'Content-type' : 'application/json'
        },
        body: jsonEncode(
          {
            "Img": productImageController.text,
            "ProductCode": productCodeController.text,
            "ProductName": productNameController.text,
            "Qty": productQuantityController.text,
            "TotalPrice": productTotalPriceController.text,
            "UnitPrice": productUnitPriceController.text,

          }
        ),
    );
    final responseJson = jsonDecode(response.body);
    if(responseJson['status']=='success'){
      productNameController.clear();
      productCodeController.clear();
      productQuantityController.clear();
      productUnitPriceController.clear();
      productTotalPriceController.clear();
      productImageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added Successfully'))
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Add Failed'))
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productNameController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Product Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    border: OutlineInputBorder()
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productCodeController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Product Code';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Product Code',
                    border: OutlineInputBorder()
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productQuantityController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Quantity';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    border: OutlineInputBorder()
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productUnitPriceController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Unit Price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Unit Price',
                    border: OutlineInputBorder()
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productTotalPriceController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Total Price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Total Price',
                    border: OutlineInputBorder()
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: productImageController,
                  validator: (String? value){
                    if(value?.trim().isEmpty ?? true){
                      return 'Image';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Image',
                    border: OutlineInputBorder()
                  ),
                ),
                ElevatedButton(onPressed: (){
                  if (formKey.currentState!.validate()) {
                    addnewProduct();
                  }
                }, child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),

    );
  }
}


