import 'package:flutter/material.dart';

class SupportRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My support requests',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF800000),
        titleSpacing: 0, 
        elevation: 0,
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFFFDEFD0),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.email_outlined,
                  color: Color(0xFF800000),
                  size: 80,
                ),
              ),
            ),
            SizedBox(height: 24),
            // All clear! Text
            Text(
              'All clear!',
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            // Subtext
            Text(
              'You have no recent requests!',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
