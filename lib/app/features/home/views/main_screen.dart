import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search/views/search_screen.dart';
import '../controllers/main_screen_controller.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainScreenController mainScreenController =
      Get.put(MainScreenController());

  // List of Widgets to show according to currentIndex
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: _screens[mainScreenController
            .currentIndex.value], // Displays the selected screen
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainScreenController.currentIndex.value,
          onTap: (index) {
            // Changing the index on tap
            mainScreenController.currentIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      );
    });
  }
}
