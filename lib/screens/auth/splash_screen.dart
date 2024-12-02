import 'package:flutter/material.dart';
import 'dart:async'; // For delayed loading
import '/screens/home/home_screen.dart'; // Import your Home Screen
import 'signup_screen.dart'; // Import your SignUp Screen
import 'package:provider/provider.dart';
import '/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Simulate a delay and navigate to the next screen based on authentication status
  _navigateToNextScreen() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Use WidgetsBinding to run the code after the current frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authProvider.checkSession(); // Check if user is logged in

      // Simulate loading delay
      Future.delayed(Duration(seconds: 5), () {
        if (mounted) {
          // If user is authenticated, go to Home, otherwise go to SignUp
          if (authProvider.user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          }
        }
      });
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
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.gif'), // Your logo image
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
