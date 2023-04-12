import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'imageViewer_Screen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  List<Reference> storageReference = [];

  Future getImages() async {
    await firebaseStorage.ref('images').listAll().then((value) async {
      for (var valu in value.items) {
        storageReference = value.items;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Screen'),
      ),
      body: ListView.builder(
          itemCount: storageReference.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                final url = await storageReference[index].getDownloadURL();
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => ImageViewer(url: url)));
              },
              title: Text(storageReference[index].name),
            );
          }),
    );
  }
}