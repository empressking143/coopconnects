import 'package:coopconnects/screens/order/order_code.dart'; // Update import
import 'package:flutter/material.dart';
import 'screens/order/order_code.dart'; // Update import
import 'package:provider/provider.dart';
import 'screens/menu/menu_screen.dart';
import 'providers/menu_provider.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/screens/notification/notification_screen.dart';
import 'package:coopconnects/screens/home/home_screen.dart';
import 'screens/kiosk/kiosk_screen.dart';
import 'providers/kiosk_provider.dart';
import 'package:coopconnects/screens/profile/profile_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => KioskProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()), // Assuming you want this for notifications
      ],
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
      home: OrderCode(),  // Set OrderCode as the main screen
      routes: {
        '/notifications': (context) => NotificationScreen(),
        '/kiosk': (context) => KioskScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),  // Assuming you want to add HomeScreen route as well
      },
    );
  }
}
