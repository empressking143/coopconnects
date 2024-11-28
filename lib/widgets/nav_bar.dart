import 'package:flutter/material.dart';
import 'package:coopconnects/screens/home/home_screen.dart';
import 'package:coopconnects/screens/profile/profile_screen.dart';
import 'package:coopconnects/screens/menu/menu';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0, // Adjust the height of the BottomAppBar
      child: BottomAppBar(
        color: const Color(0xFF800000), // Dark red background color
        shape: CircularNotchedRectangle(), // Notched shape for FAB
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the icons
          children: [
            // Menu Button
            Expanded(
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen()),
                  );
                },
              ),
            ),
            // Home Button
            Expanded(
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ),
            // Profile Button
            Expanded(
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
