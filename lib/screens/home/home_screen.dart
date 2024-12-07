import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:coopconnects/widgets/app_bar.dart'; // Import the custom AppBar
import 'package:coopconnects/widgets/nav_bar.dart'; // Import the custom NavBar

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(), // Use the custom AppBar
      backgroundColor: Color(0xFFFFF8E8),
      resizeToAvoidBottomInset: true, // Prevent overflow when keyboard appears
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: "Hot Deals" with Fire Animation
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hot Deals',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 8), // Space between text and animation
                Lottie.asset(
                  'assets/animations/fire.json',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            SizedBox(height: 10), // Space between "Hot Deals" and advertisement

            // Large Rectangle Advertisement
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/advertisement1.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20), // Space between rows

            // Row 2: Two Square Advertisements
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // First Square
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/advertisement2.png',
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                // Second Square
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/advertisement3.png',
                    width: (MediaQuery.of(context).size.width / 2) - 30,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space between rows

            // Row 3: Large Rectangle Advertisement
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/advertisement4.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(), // Include the custom NavBar at the bottom
    );
  }
}
