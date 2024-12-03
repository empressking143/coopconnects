// lib/screens/notification_screen.dart

import 'package:flutter/material.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/widgets/notification_widget.dart';
import 'package:provider/provider.dart';
import 'package:coopconnects/widgets/app_bar.dart'; // Import the custom AppBar
import 'package:coopconnects/widgets/nav_bar.dart'; 

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Loading notifications
    final provider = Provider.of<NotificationProvider>(context);
    provider.loadNotifications();

    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Color(0xFFFFF8E8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: provider.notifications.length,
                itemBuilder: (context, index) {
                  final notification = provider.notifications[index];
                  return NotificationWidget(notification: notification);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
