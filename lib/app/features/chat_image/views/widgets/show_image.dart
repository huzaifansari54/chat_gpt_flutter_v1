import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PhotoView(
        imageProvider: MemoryImage(base64.decode(image)),
        loadingBuilder: (context, event) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
