import 'package:flutter/material.dart';

class TroubleWithCheckoutScreen extends StatefulWidget {
  @override
  _TroubleWithCheckoutScreenState createState() =>
      _TroubleWithCheckoutScreenState();
}

class _TroubleWithCheckoutScreenState extends State<TroubleWithCheckoutScreen> {
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
        titleSpacing: 0,
        title: Text(
          'I\'m having trouble with my checkout',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If you’re unable to click the Checkout button, here are the most likely scenarios:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 16),
            buildStep(1, 'The kiosk/store is closed.'),
            SizedBox(height: 12),
            buildStep(2, 'One of your selected items is no longer available.'),
            SizedBox(height: 12),
            buildStep(3,
                'Make sure you have sufficient balance if you are paying with Gcash, PayMaya, etc.'),
            SizedBox(height: 24),
            Text(
              'In any of these instances, please place another order.',
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
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            buildResponseButton(
              context,
              'Yes, I got my answer',
              0, // Index for the first button
            ),
            SizedBox(height: 12),
            buildResponseButton(
              context,
              'No, add more information',
              1, // Index for the second button
            ),
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

  Widget buildResponseButton(BuildContext context, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
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
