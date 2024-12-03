import 'package:coopconnects/screens/profile/get_help_order.dart'; // Import GetHelpOrder screen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/kiosk/kiosk_screen.dart'; // Retain KioskScreen import
import 'providers/kiosk_provider.dart';  // Retain KioskProvider import

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
      home: GetHelpOrder(),  // Change home to GetHelpOrder
      debugShowCheckedModeBanner: false,  // Removes the debug banner
      routes: {
        '/get-help-order': (context) => GetHelpOrder(),  // Add route for GetHelpOrder
      },
    );
  }
}
