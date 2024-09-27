import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../details/views/movie_details_screen.dart';
import '../../search/views/search_screen.dart';
import '../controllers/movie_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Column(
        children: [
          // Search Bar at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the Search Screen when the search bar is tapped
                Get.to(() => const SearchScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Search movies...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Movies List
          Expanded(
            child: Obx(() {
              if (movieController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                // shrinkWrap: true,
                itemCount: movieController.movies.length,
                itemBuilder: (context, index) {
                  final movie = movieController.movies[index];
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
                        subtitle: Text(movie.show?.summary ?? 'Not Available'),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
