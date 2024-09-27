import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details/views/movie_details_screen.dart';
import '../controllers/movie_search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final MovieSearchController movieSearchController =
      Get.put(MovieSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar at the top
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onSubmitted: (query) {
                // handling search logic here //
                // filtering movies based on the query using API Endpoint
                debugPrint('Search query is =  $query');
                // Searching data using fetch
                movieSearchController.searchAndFetchMovies(query);
              },
            ),

            // Movies List
            Expanded(
              child: Obx(() {
                if (movieSearchController.isLoading.value) {
                  return const Center(
                      child: Text('Search for Amazing Movies !'));
                }

                return ListView.builder(
                  // shrinkWrap: true,
                  itemCount: movieSearchController.movies.length,
                  itemBuilder: (context, index) {
                    final movie = movieSearchController.movies[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the Details Screen
                        Get.to(() => MovieDetailsScreen(movie: movie));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.network(
                            movie.show?.image?.medium ??
                                "https://www.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373243873.jpg",
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          title: Text(movie.show?.name ?? 'Not Available'),
                          subtitle:
                              Text(movie.show?.summary ?? 'Not Available'),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
