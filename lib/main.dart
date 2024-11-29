import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/screens/notification/notification_screen.dart';

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
      home: NotificationScreen(),
    );
  }
}
