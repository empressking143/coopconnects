// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/kiosk/kiosk_screen.dart';
import 'providers/kiosk_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => KioskProvider(),
      child: MyApp(),
    ),
  );
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
      home: KioskScreen(), // Directing to KioskScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
