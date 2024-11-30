import 'package:coopconnects/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/app_bar2.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: Scaffold(
        backgroundColor: Color(0xFFFFF8E8), // Set the background color of the screen
        appBar: AppBarWidget2(), // Remove AppBar
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Circular element to hold an image (above the username)
              CircleAvatar(
                radius: 80, // Adjust the size of the circle
                backgroundImage: AssetImage('assets/your_image.png'), // Placeholder for the image
                // To set a default color if no image is provided, use backgroundColor
                // backgroundColor: Colors.grey,
              ),
              SizedBox(height: 40),
              // User Name
              Text(
                'Chacha',
                style: TextStyle(
                  color: Color(0xFF800000),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 20),
              // Row with Orders, Favorites, and Cart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton('Orders', Icons.receipt),
                  _buildIconButton('Favorites', Icons.favorite),
                  _buildIconButton('Cart', Icons.shopping_cart),
                ],
              ),
              SizedBox(height: 30),
              // Menu options
              _buildMenuOption(Icons.fastfood, 'Food Preferences'),
              SizedBox(height: 10),
              _buildMenuOption(Icons.help_center, 'Help Center'),
              SizedBox(height: 10),
              _buildMenuOption(Icons.support, 'Contact Support'),
              SizedBox(height: 30),
              // Logout button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }

  // Helper to build the top row buttons
  Widget _buildIconButton(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Color(0xFF800000)),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Helper to build menu options
  Widget _buildMenuOption(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF800000)),
          SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
