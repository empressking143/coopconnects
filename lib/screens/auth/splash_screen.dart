import 'package:flutter/material.dart';
import 'dart:async'; // For delayed loading
import 'login_screen.dart'; // Import your next screen (LoginScreen)

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Ensure that the splash screen stays visible even after hot reload
    _navigateToNextScreen();
  }

  // Simulate a delay and navigate to the next screen
  _navigateToNextScreen() {
    // Use a Timer to simulate loading and transition after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) { // Ensure the widget is still in the tree before navigating
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0); // Slide from right to left
              const end = Offset.zero;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF800000), // Deep Red Background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your logo or image
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/logo.png'), // Your logo image
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: Colors.white, // White spinner to contrast with red background
            ),
          ],
        ),
      ),
    );
  }
}
