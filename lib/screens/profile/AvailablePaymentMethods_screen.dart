import 'package:flutter/material.dart';

class AvailablePaymentMethodsScreen extends StatefulWidget {
  @override
  _AvailablePaymentMethodsScreenState createState() =>
      _AvailablePaymentMethodsScreenState();
}

class _AvailablePaymentMethodsScreenState
    extends State<AvailablePaymentMethodsScreen> {
  // Track the index of the selected button (-1 means none selected)
  int selectedButtonIndex = -1;

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
          'Available payment methods',
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
              'There are various payment methods available at CO-OP Connects! You can pay via:',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 16),
            buildPaymentMethodStep(1, 'Cash on counter'),
            SizedBox(height: 12),
            buildPaymentMethodStep(2, 'PayPal'),
            SizedBox(height: 12),
            buildPaymentMethodStep(3, 'GCash'),
            SizedBox(height: 12),
            buildPaymentMethodStep(4, 'PayMaya'),
            SizedBox(height: 24),
            Text(
              'To know more details about our payment features, head over to the CO-OP Connects pay section on Help Center.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                'Was this helpful?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 16),
            buildResponseButton(context, 'Yes, I got my answer', 0),
            SizedBox(height: 12),
            buildResponseButton(context, 'No, add more information', 1),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentMethodStep(int stepNumber, String methodName) {
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
            methodName,
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
    
          selectedButtonIndex = index;
        });
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: selectedButtonIndex == index
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
              color: selectedButtonIndex == index
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
