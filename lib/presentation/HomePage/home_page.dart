import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/presentation/HomePage/components/carousel.dart';
import 'package:movie_app/presentation/HomePage/components/now_playing_section.dart';
import 'package:movie_app/presentation/HomePage/components/trailer_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MoviesModel> movies = MoviesModel.getMovies();
  final PageController _pageController = PageController();

  List<String> carouselImages = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Carousel(
            pageController: _pageController,
            images: carouselImages,
          ),
          SizedBox(height: 30),
          NowPlayingSection(),
          SizedBox(height: 30),
          TrailerSection(),
        ],
      ),
    );
  }
}
