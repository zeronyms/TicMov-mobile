import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/presentation/DetailMovie/detail_movie.dart';
import 'package:movie_app/presentation/HomePage/components/movie_card.dart';
import 'package:movie_app/presentation/HomePage/components/section_template.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MoviesModel.getMovies();

    return SectionTemplate(
      title: "SEDANG TAYANG",
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: movies.length,
          separatorBuilder: (_, __) => const SizedBox(width: 25),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMovie(movie: movies[index]),
                  ),
                );
              },
              child: MovieCard(movie: movies[index]),
            );
          },
        ),
      ),
    );
  }
}
