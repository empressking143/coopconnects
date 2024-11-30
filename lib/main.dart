import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/kiosk/kiosk_screen.dart';  // Retain KioskScreen import
import 'providers/kiosk_provider.dart';    // Retain KioskProvider import
// Remove MenuScreen and other features from home as KioskScreen is now the focus

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => KioskProvider(),  // Retain KioskProvider for KioskScreen
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
      home: KioskScreen(),  // Direct to KioskScreen
      debugShowCheckedModeBanner: false,  // Removes the debug banner
    );
  }
}
