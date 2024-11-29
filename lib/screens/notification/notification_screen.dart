// lib/screens/notification_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coopconnects/providers/notification_provider.dart';
import 'package:coopconnects/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch notifications when the screen is built
    final notificationProvider = Provider.of<NotificationProvider>(context);
    notificationProvider.fetchNotifications();

    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Set the background color to match the header
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
            SizedBox(height: 16), // Add space below the title
            Expanded(
              child: Consumer<NotificationProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = provider.notifications[index];
                      return NotificationCard(
                        notification: notification,
                        onTap: () => provider.markAsRead(index),
                      );
                    },
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
