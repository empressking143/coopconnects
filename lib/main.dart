import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const CoopConnects());
}

class CoopConnects extends StatelessWidget {
  const CoopConnects({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: HomeScreen(),
    );
  }
}