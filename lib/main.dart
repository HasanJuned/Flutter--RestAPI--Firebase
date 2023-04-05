import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookListScreen(),
    );
  }
}

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance; /// --> Collection of Database
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    getBookList();
  }

  Future<void> getBookList() async{
    firebaseFirestore.collection('books').get().then((documents) {
      for(var doc in documents.docs){
        log(doc.get('name'));
      }

    }); /// access the collection from firebase }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books Collection'),
      ),

      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Title'),
              subtitle: Text('Writter'),
              trailing: Text('2001'),
            );
          }),
    );
  }

}

class Book{
  final String name, writterName, year;

  Book(this.name, this.writterName, this.year);
}
