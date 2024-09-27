import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/features/home/views/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
