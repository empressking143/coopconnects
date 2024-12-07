import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/notification_provider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Load notifications after the screen is built
      Provider.of<NotificationProvider>(context, listen: false).loadNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF800000), // Maroon background
        iconTheme: IconThemeData(color: Colors.white), // Back arrow color white
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) {
          final notifications = notificationProvider.notifications;

          if (notifications.isEmpty) {
            return Center(
              child: Text(
                'No notifications available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    notification.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notification.message),
                  trailing: Text(notification.time),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
