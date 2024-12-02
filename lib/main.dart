import 'package:flutter/material.dart';
import 'routes.dart'; // Import your route file
void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: HomeScreen(), // Set HomeScreen as the first screen
    );
  }
}
