import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';

class TrailerCard extends StatelessWidget {
  final MoviesModel movie;

  const TrailerCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                movie.movieTrailerImage,
                width: 176,
                height: 99,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Icon(
                  Icons.play_circle,
                  size: 35,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
        Text(
          movie.name,
          style: const TextStyle(
            fontSize: 14, 
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
