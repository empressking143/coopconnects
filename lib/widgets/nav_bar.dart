import 'package:flutter/material.dart';
import 'package:coopconnects/screens/home/home_screen.dart';
import 'package:coopconnects/screens/profile/profile_screen.dart';
import 'package:coopconnects/screens/kiosk/kiosk_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                icon: FaIcon(FontAwesomeIcons.bowlFood, color: Colors.white,),
                onPressed: () {
                  // Use a fade transition for smooth navigation
                  Navigator.push(
                    context,
                    _fadeRoute(KioskScreen()),
                  );
                },
              ),
            ),
            // Home Button
            Expanded(
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.house, color: Colors.white,),
                onPressed: () {
                  // Use a fade transition for smooth navigation
                  Navigator.push(
                    context,
                    _fadeRoute(HomeScreen()),
                  );
                },
              ),
            ),
            // Profile Button
            Expanded(
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.solidUser, color: Colors.white,),
                onPressed: () {
                  // Use a fade transition for smooth navigation
                  Navigator.push(
                    context,
                    _fadeRoute(ProfileScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom fade transition route
  PageRouteBuilder _fadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Fade transition
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
