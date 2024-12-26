import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/presentation/HomePage/components/section_template.dart';
import 'package:movie_app/presentation/HomePage/components/trailer_card.dart';

class TrailerSection extends StatelessWidget {
  const TrailerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MoviesModel.getMovies();

    return SectionTemplate(
      title: "TRAILER FILM",
      child: SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: movies.length,
          separatorBuilder: (_, __) => const SizedBox(width: 25),
          itemBuilder: (context, index) {
            return TrailerCard(movie: movies[index]);
          },
        ),
      ),
    );
  }
}
