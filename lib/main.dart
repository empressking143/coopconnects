import 'package:coopconnects/firebase_options.dart';
import 'package:coopconnects/routes.dart'; // Ensure the correct import for routes
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/menu', // Open the menu_screen first
      onGenerateRoute: generateRoute, // Use generateRoute for navigation
      debugShowCheckedModeBanner: false,
    );
  }
}
