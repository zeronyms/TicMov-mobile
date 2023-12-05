import 'package:flutter/material.dart';

List<String> getImagePaths() {
  // Replace these paths with your actual image paths
  return [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg',
  ];
}

Widget buildImageWidget(String imagePath) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.amber,
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
      ),
    ),
  );
}
