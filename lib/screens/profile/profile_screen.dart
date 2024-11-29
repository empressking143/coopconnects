import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/app_bar.dart'; // Import the custom AppBar
import 'package:coopconnects/widgets/nav_bar.dart'; // Import the custom NavBar

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF800000), // Customize with your theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              backgroundImage: AssetImage('assets/images/default_profile.png'), // Replace with actual image
            ),
            SizedBox(height: 20),
            Text(
              'Name: John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: johndoe@example.com'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle logout or other actions
              },
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6F6F6), // Light background color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Adjust padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  side: BorderSide(color: Color(0x7F808080)), // Border color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
