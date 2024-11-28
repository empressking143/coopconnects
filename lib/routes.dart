import 'package:flutter/material.dart';
import 'screens/menu/menu_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/menu':
      return MaterialPageRoute(builder: (_) => MenuScreen());
    default:
      return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Page not found'))));
  }
}
