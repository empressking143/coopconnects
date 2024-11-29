import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Make sure to import the provider package
import 'package:coopconnects/screens/notification/notification_screen.dart';
import 'providers/notification_provider.dart';  // Import the NotificationProvider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        title: 'CoopConnects',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: NotificationScreen(),
      ),
    );
  }
}
