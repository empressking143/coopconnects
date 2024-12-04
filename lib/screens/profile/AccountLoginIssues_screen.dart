import 'package:flutter/material.dart';

class AccountLoginIssuesPage extends StatelessWidget {
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
        titleSpacing: 0, // Title closer to the back button
        title: Text(
          'Account login issues',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 24, // Matches the font size reference
          ),
        ),
        backgroundColor: Color(0xFF800000),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24), // Slightly more spacing above the first box
            buildOption(context, 'I can’t sign up using my email address'),
            SizedBox(height: 20), // Increased spacing between the text boxes
            buildOption(context, 'Number already registered'),
            SizedBox(height: 20), // Increased spacing between the text boxes
            buildOption(context, 'Other login issue'),
          ],
        ),
      ),
    );
  }

  Widget buildOption(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0x7F808080), width: 1),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF800000), // Text color matches AppBar
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
