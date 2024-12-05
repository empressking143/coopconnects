import 'package:flutter/material.dart';

class PaymentIssuesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF800000), 
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: Text(
          'Payment issues',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFFFF5E4),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PaymentOptionCard(
              title: "I’m having trouble with checkout",
              onTap: () {
                // Navigate or handle tap action
              },
            ),
            SizedBox(height: 16),
            PaymentOptionCard(
              title: "Available payment methods",
              onTap: () {
                // Navigate or handle tap action
              },
            ),
            SizedBox(height: 16),
            PaymentOptionCard(
              title: "Other payment inquiry",
              onTap: () {
                // Navigate or handle tap action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PaymentOptionCard({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x7F808080), width: 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios, 
              color: Colors.black.withOpacity(0.8),
              size: 16, 
            ),
          ],
        ),
      ),
    );
  }
}
