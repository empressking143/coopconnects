import 'package:flutter/material.dart';

class AppBarWidget2 extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget2({Key? key})
      : preferredSize = Size.fromHeight(65.0), // Height of the AppBar
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF800000), // Set the background color of the AppBar
      automaticallyImplyLeading: false, // Disable the default back button on the home screen
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute the space evenly
        children: [
          // Left side: "Account Info"
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Account Info',
              style: TextStyle(
                fontSize: 18, // Adjust font size as needed
                color: Colors.white,
              ),
            ),
          ),
          // Right side: Bell Icon
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white, size: 26),
              onPressed: () {
                // Define notification functionality, navigate to notifications page or perform action
              },
            ),
          ),
        ],
      ),
    );
  }
}
