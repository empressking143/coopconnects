import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/menu/menu_screen.dart';
import 'providers/menu_provider.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/screens/notification/notification_screen.dart';
import 'package:coopconnects/screens/home/home_screen.dart'; // Assuming HomeScreen is here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensures widgets are initialized
  await Firebase.initializeApp();  // Initializes Firebase
  runApp(
    ChangeNotifierProvider(
      create: (context) => MenuProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: MenuScreen(),
    );
  }
}
