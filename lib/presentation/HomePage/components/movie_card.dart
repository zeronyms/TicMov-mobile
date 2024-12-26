import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';

class MovieCard extends StatelessWidget {
  final MoviesModel movie;

  const MovieCard({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            movie.movieCover,
            height: 150,
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 15),
        Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 4,
              children: [
                for (String theatre in movie.theatres)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: theatre == 'CGV'
                          ? Colors.red
                          : theatre == 'XXI'
                              ? const Color.fromARGB(255, 212, 124, 1)
                              : Colors.transparent,
                    ),
                    child: Text(
                      theatre,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10, // Theatre label font size
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
