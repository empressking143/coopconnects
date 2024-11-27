import 'package:flutter/material.dart';
import 'package:coopconnects/screens/auth/login_screen.dart';
import 'package:coopconnects/screens/home/home_screen.dart';
import 'package:coopconnects/screens/menu/menu_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case '/menu':
      return MaterialPageRoute(builder: (_) => MenuScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
