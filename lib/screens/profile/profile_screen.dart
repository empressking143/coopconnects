import 'package:coopconnects/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/app_bar2.dart';
import 'SupportRequests_screen.dart';
// import 'contact_support.dart';
import 'favorites_screen.dart';
import 'foodpreferences_screen.dart';
import 'settings_screen.dart';
import 'helpcenter_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFF8E8), // Set the background color of the screen
        appBar: AppBarWidget2(), // Custom AppBar
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Circular element to hold an image (above the username)
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/ming.png'), // Profile image
                ),
                SizedBox(height: 40),
                // User Name
                Text(
                  'Reylo Jace',
                  style: TextStyle(
                    color: Color(0xFF800000),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 20),
                // Row with Orders, Favorites, and Cart buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton(context, 'Orders', Icons.receipt, () {
                      print('Orders button clicked!');
                    }),
                    _buildIconButton(context, 'Favorites', Icons.favorite, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoritesPage()),
                      );
                    }),
                    _buildIconButton(context, 'Cart', Icons.shopping_cart, () {
                      print('Cart button clicked!');
                    }),
                  ],
                ),
                SizedBox(height: 30),
                // Menu options
                _buildMenuOption(Icons.fastfood, 'Food Preferences', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPreferencesScreen()),
                  );
                }),
                SizedBox(height: 10),
                _buildMenuOption(Icons.settings, 'Settings', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                }),
                SizedBox(height: 10),
                _buildMenuOption(Icons.help_center, 'Help Center', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                  );
                }),
                SizedBox(height: 10),
                _buildMenuOption(Icons.support, 'Contact Support', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                  );
                }),
                SizedBox(height: 30),
                // Logout button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Log Out button clicked!');
                    },
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
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }

  // Helper to build the top row buttons with a navigation callback
  Widget _buildIconButton(
      BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }

  // Helper to build menu options with navigation
  Widget _buildMenuOption(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
