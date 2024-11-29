import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/menu/menu_screen.dart';
import 'providers/menu_provider.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuScreen(),
    );
  }
}
