import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/pages/home.dart';
import 'package:movie_app/presentation/DetailMovie/components/buy_ticket_button.dart';
import 'package:movie_app/presentation/DetailMovie/components/movie_description_section.dart';
import 'package:movie_app/presentation/DetailMovie/components/movie_rating_section.dart';
import 'package:movie_app/presentation/DetailMovie/components/video_holder_section.dart';

class DetailMovie extends StatelessWidget {
  final MoviesModel movie;
  const DetailMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VideoHolderSection(movie: movie),
            MovieRatingSection(movie: movie),
            MovieDescriptionSection(movie: movie),
            BuyTicketButton(),
          ],
        ),
      ),
    );
  }
}
