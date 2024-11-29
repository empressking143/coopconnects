import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/screens/notification/notification_screen.dart';
import 'package:coopconnects/screens/home/home_screen.dart'; // Assuming HomeScreen is here

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotificationProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects',
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: HomeScreen(),  // HomeScreen is the start screen
      routes: {
        '/notifications': (context) => NotificationScreen(),  // Add NotificationScreen route
      },
    );
  }
}