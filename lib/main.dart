import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

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
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<Book> books = [];
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    //getBookList();
  }

  Future<void> getBookList() async {
    inProgress = true;
    setState(() {});
    books.clear();
    await firebaseFirestore.collection('books').get().then((documents) {
      for (var doc in documents.docs) {
        books.add(Book(doc.get('name'), doc.get('writter'), doc.get('year')));
      }
    });

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Collection'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: firebaseFirestore.collection('books').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              books.clear();
              for (var doc in snapshot.data!.docs) {
                books.add(Book(doc.get('name'), doc.get('writter'), doc.get('year')));
              }
              return ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(books[index].name),
                      subtitle: Text(books[index].authorName),
                      trailing: Text(books[index].year),
                    );
                  });
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          }),
    );
  }
}

class Book {
  final String name, authorName, year;

  Book(this.name, this.authorName, this.year);
}
