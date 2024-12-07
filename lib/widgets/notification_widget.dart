// lib/widgets/notification_widget.dart

import 'package:flutter/material.dart';
import 'package:coopconnects/models/notification_model.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notification;

  NotificationWidget({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              notification.message,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 8),
            Text(
              notification.time,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
