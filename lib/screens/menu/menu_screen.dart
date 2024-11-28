import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/nav_bar.dart'; // Import the NavBar widget
import 'package:coopconnects/widgets/app_bar.dart'; // Import your custom AppBarWidget

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(), // Use your custom AppBarWidget here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Items:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Item 1'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Handle the tap for Item 1
              },
            ),
            ListTile(
              title: Text('Item 2'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Handle the tap for Item 2
              },
            ),
            ListTile(
              title: Text('Item 3'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                // Handle the tap for Item 3
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(), // Add the NavBar widget here
    );
  }
}
