import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/auth_provider.dart';
import 'screens/auth/splash_screen.dart'; // Import your custom splash screen
import 'screens/home/home_screen.dart'; // Import your Home Screen
import 'screens/auth/signup_screen.dart'; // Import your SignUp Screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
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
      home: SplashScreen(), // Set SplashScreen as the first screen
      routes: {
        '/home': (context) => HomeScreen(), // Home screen after login
        '/signup': (context) => SignUpScreen(), // Sign up screen if not logged in
      },
    );
  }
}
