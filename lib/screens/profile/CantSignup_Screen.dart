import 'package:flutter/material.dart';

class CantSignupScreenPage extends StatefulWidget {
  @override
  _CantSignupScreenPageState createState() => _CantSignupScreenPageState();
}

class _CantSignupScreenPageState extends State<CantSignupScreenPage> {
  String? selectedButton;

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
        titleSpacing: 0,
        title: Text(
          'I can’t sign up using my email address',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF800000), 
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24), 
            Center(
              child: Text(
                'If you can’t sign up using your email, it is likely that you are already registered at Coop Connects.',
                textAlign: TextAlign.center, 
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 64), 
            Center(
              child: Text(
                'Was this helpful?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 32), 
            buildButton('Yes, I got my answer', 'yes'),
            SizedBox(height: 24), 
            buildButton('No, add more information', 'no'),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, String buttonKey) {
    bool isSelected = selectedButton == buttonKey;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = buttonKey; 
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF800000) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0x7F808080),
            width: 1,
          ),
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
              color: isSelected ? Colors.white : Color(0xFF800000),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
