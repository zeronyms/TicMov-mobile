import 'package:flutter/material.dart';
// import 'package:movie_app/pages/detail_movie_revisi.dart';
// import 'package:movie_app/pages/detail_movie.dart';
import 'package:movie_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'BeVietnamPro'),
      // home: const MovieDetail(),
      home: const Home(),
    );
  }
}
