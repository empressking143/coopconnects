import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/notification/notification_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({Key? key})
      : preferredSize = Size.fromHeight(65.0), // Height of the AppBar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF800000), // Set the background color of the AppBar
      automaticallyImplyLeading: false, // Disable the default back button on the home screen
      elevation: 0,
      title: Container(
        width: 400, // Increased width for the search bar
        height: 40, // Adjusted height for the search bar
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(25), // More pronounced rounded corners
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6, // Softer shadow for a smooth effect
              offset: Offset(0, 4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust horizontal padding
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey[600], size: 24), // Slightly larger search icon for better visibility
              SizedBox(width: 10), // Space between the icon and the text field
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black), // Text color set to black while typing
                  textAlignVertical: TextAlignVertical.center, // Vertically center the text
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16), // Slightly larger hint text for clarity
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10), // Adjust vertical padding inside the TextField
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Cart icon with a bit of space between them for better accessibility
        IconButton(
          icon: FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white),
          onPressed: () {
            // Navigate to CartScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
        ),

        SizedBox(width: 10), // Space between cart and bell icons
        // Bell icon with enhanced visibility
        IconButton(
          icon: FaIcon(FontAwesomeIcons.solidBell, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationScreen()),
            );
            // Define notification functionality, navigate to the notifications page or perform action
          },
        ),
        SizedBox(width: 10), // Padding to ensure the icons don’t touch the edge
      ],
    );
  }
}
