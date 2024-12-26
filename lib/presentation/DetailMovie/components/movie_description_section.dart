import 'package:flutter/material.dart';
import 'package:movie_app/model/movies_model.dart';

class MovieDescriptionSection extends StatelessWidget {
  final MoviesModel movie;

  const MovieDescriptionSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              "Detail Film",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          _buildDetailSection("Synopsis", movie.sinopsis),
          const Divider(height: 40),
          _buildDetailSection("Aktor", movie.actor),
          const Divider(height: 40),
          _buildDetailSection("Sutradara", movie.director),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
