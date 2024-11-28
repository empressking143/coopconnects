import 'package:flutter/material.dart';
import 'package:coopconnects/notification/notification_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Only keep the route for NotificationScreen
  if (settings.name == '/notification') {
    return MaterialPageRoute(builder: (_) => NotificationScreen());
  }

  // Return a default route if an undefined route is requested
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    ),
  );
}
