import 'package:coopconnects/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'screens/order/order_screen.dart';

void main() {
  runApp(const CoopConnects());
}

class CoopConnects extends StatelessWidget {
  const CoopConnects({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: OrderScreen(), // Set HomeScreen as the first screen
    );
  }
}
