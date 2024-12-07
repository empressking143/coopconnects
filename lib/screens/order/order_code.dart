import 'package:flutter/material.dart';

class OrderCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
      crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
      children: [
        _buildQRCode(),
        SizedBox(height: 20), // Space between QR code and text
        _buildTitle(),
      ],
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      width: 298,
      height: 58,
      child: Text(
        'Please Present This QR \nCode at Your Selected Kiosk',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF800000),
          fontSize: 19,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 1.5, // Adjust this to control line spacing
        ),
      ),
    );
  }

  Widget _buildQRCode() {
    return Container(
      width: 340,
      height: 435,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/qrcode.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
