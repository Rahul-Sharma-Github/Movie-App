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
                  shrinkWrap: true,
                  itemCount: movieSearchController.movies.length,
                  itemBuilder: (context, index) {
                    final movie = movieSearchController.movies[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the Details Screen
                        Get.to(() => MovieDetailsScreen(movie: movie));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(14.0),
                        padding: const EdgeInsets.all(0.0),
                        height: 300,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFD22F26),
                                Color(0xFFB1060F),
                                Color(0xFFFE0202)
                              ]),
                          // border: Border.all(),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 300,
                              child: Hero(
                                  tag: "photo-${movie.show?.id}",
                                  child: Image.network(
                                    movie.show?.image?.medium ??
                                        "https://www.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373243873.jpg",
                                    // width: 100,
                                    // height: 100,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Expanded(
                                          child: Text(
                                            movie.show?.name ?? 'Not Available',
                                            softWrap: false,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ]),
                                      const SizedBox(height: 12.0),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              movie.show?.summary?.replaceAll(
                                                      RegExp(r"<[^>]*>",
                                                          multiLine: true,
                                                          caseSensitive: true),
                                                      '') ??
                                                  'Not Available',
                                              softWrap: true,
                                              maxLines: 10,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
