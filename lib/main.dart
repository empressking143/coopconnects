import 'package:flutter/material.dart';
import 'routes.dart'; // Import your route file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
        primarySwatch: Colors.red,
      ),
      initialRoute: '/', // Default route
      onGenerateRoute: generateRoute, // Refer to route.dart for route handling
    );
  }
}
