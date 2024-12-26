import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';
import 'package:movie_app/presentation/DetailMovie/components/favorite_button.dart';

class MovieRatingSection extends StatelessWidget {
  final MoviesModel movie;

  const MovieRatingSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                movie.movieCover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Text(
                        movie.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 26, 57, 1),
                        ),
                      ),
                    ),
                    const Expanded(flex: 1, child: FavoriteButton()),
                  ],
                ),
                const SizedBox(height: 15),
                _buildTags(),
                const SizedBox(height: 15),
                _buildAttributes(context),
                const SizedBox(height: 15),
                _buildRating(movie.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTags() {
    return Row(
      children: [
        _buildTag("Action"),
        const SizedBox(width: 5),
        _buildTag("Historical"),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.6)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
      ),
    );
  }

  Widget _buildAttributes(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _buildAttribute(Icons.event, movie.tanggalTayang),
        _buildAttribute(Icons.tv, movie.ageRestriction),
        _buildAttribute(Icons.schedule, movie.movieDuration),
      ],
    );
  }

  Widget _buildAttribute(IconData icon, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRating(String rating) {
    return Row(
      children: [
        const Text(
          "Rating: ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          rating,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
