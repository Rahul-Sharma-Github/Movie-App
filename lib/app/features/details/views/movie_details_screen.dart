import 'package:flutter/material.dart';

import '../../home/models/movie_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.show!.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                    tag: "photo-${movie.show?.id}",
                    child: Image.network(
                      movie.show?.image?.medium ??
                          "https://www.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373243873.jpg",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(height: 16),
              Text(
                movie.show?.name ?? 'Not Available',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                movie.show?.summary?.replaceAll(
                        RegExp(r"<[^>]*>",
                            multiLine: true, caseSensitive: true),
                        '') ??
                    'Not Available',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
