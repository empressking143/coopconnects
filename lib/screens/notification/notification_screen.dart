import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Color(0xFF800000),
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFFFFF8E8), // Light color for the header
        iconTheme: IconThemeData(
          color: Color(0xFF800000),
        ),
      ),
      backgroundColor: Color(0xFFFFF8E8), // Set the background color to match the header
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
              title: 'Order Completed!',
              message: 'Your order ASDN39293U72 has been successfully completed on 9/28/2024. Kindly check the items and, if possible, share your feedback by providing a rating.',
            ),
            NotificationCard(
              title: 'Order Completed!',
              message: 'Your order LJSM29847T55 has been successfully completed. Kindly check the items and, if possible, share your feedback by providing a rating.',
            ),
            NotificationCard(
              title: 'Order Canceled.',
              message: 'Your order ZBCX54712P09 has been canceled on 9/25/2024. Payment will be reimbursed shortly.',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;

  NotificationCard({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      color: Colors.white, // Set the background color of the card to white
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
