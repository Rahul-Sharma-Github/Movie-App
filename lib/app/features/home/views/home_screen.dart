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
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the Search Screen when the search bar is tapped
                Get.to(() => SearchScreen());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 18.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[800]),
                    const SizedBox(width: 10),
                    Text(
                      'Search movies...',
                      style: TextStyle(color: Colors.grey[600]),
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
                shrinkWrap: true,
                itemCount: movieController.movies.length,
                itemBuilder: (context, index) {
                  final movie = movieController.movies[index];
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
                                transitionOnUserGestures: true,
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
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
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
    );
  }
}





/////////////
// Card(
//                       margin: const EdgeInsets.all(10),
//                       child: ListTile(
//                         leading: AspectRatio(
//                           aspectRatio: 1.0,
//                           child: Image.network(
//                             movie.show?.image?.medium ??
//                                 "https://www.shutterstock.com/image-vector/no-image-available-sign-absence-260nw-373243873.jpg",
//                             width: 100,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         title: Text(movie.show?.name ?? 'Not Available'),
//                         subtitle: Text(movie.show?.summary ?? 'Not Available'),
//                       ),
//                     )