import 'package:flutter/material.dart';

class AppIssuesScreen extends StatefulWidget {
  @override
  _AppIssuesScreenState createState() => _AppIssuesScreenState();
}

class _AppIssuesScreenState extends State<AppIssuesScreen> {
  int? selectedIndex; 
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
          'App issues',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFF800000), 
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Having issues with the app? Try these quick fixes:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 16),
            buildStep(1, 'Check your internet connection: Ensure a stable connection for seamless app use'),
            SizedBox(height: 12),
            buildStep(2, 'Refresh your device: Close other apps for optimum performance'),
            SizedBox(height: 12),
            buildStep(3, 'Start fresh: Reinstall the app if issues persist'),
            SizedBox(height: 24),
            Text(
              'If the issue still persists after you’ve tried all the steps above, it could be due to a temporary server downtime. Don’t worry, our technical team would already be on the case! We’d advise checking back after some time.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Was this helpful?',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 16),
            buildResponseButton('Yes, I got my answer', 0),
            SizedBox(height: 12),
            buildResponseButton('No, add more information', 1),
          ],
        ),
      ),
    );
  }

  Widget buildStep(int stepNumber, String stepText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(0.05),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              '$stepNumber',
              style: TextStyle(
                color: Color(0xFF800000),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            stepText,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildResponseButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Toggle the selected index
          selectedIndex = (selectedIndex == index) ? null : index;
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Color(0xFF800000)
              : Colors.white, 
          borderRadius: BorderRadius.circular(10),
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
              color: selectedIndex == index
                  ? Colors.white 
                  : Color(0xFF800000), 
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}