import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final String kioskName;

  MenuScreen({required this.kioskName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Set background color
      appBar: AppBar(
        title: Text(kioskName),
        backgroundColor: Color(0xFF800000),
      ),
      body: Center(
        child: Text(
          'Welcome to $kioskName!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF800000)),
        ),
      ),
    );
  }
}
