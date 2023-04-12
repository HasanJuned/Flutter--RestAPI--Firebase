import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String url;
  const ImageViewer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
