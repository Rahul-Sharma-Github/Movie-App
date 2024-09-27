import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/movie_model.dart';

class MovieController extends GetxController {
  final movies = <Movie>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  Future<void> fetchMovies() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

      if (response.statusCode == 200) {
        List<dynamic>? data = json.decode(response.body);
        movies.value = data!.map((movie) => Movie.fromJson(movie)).toList();
        debugPrint(movies.toString());
      } else {
        Get.snackbar('Error', 'Failed to fetch movies');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
