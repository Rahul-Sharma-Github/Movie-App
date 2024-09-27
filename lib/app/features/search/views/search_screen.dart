import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                // You can handle search logic here
                // e.g., filter movies based on the query or make an API request
                debugPrint('Search query: $query');
              },
            ),
            // You can add a ListView or GridView below to show search results
            const Expanded(
              child: Center(
                child: Text(
                  'Search for your favorite movies!',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
