import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: Text(
            'KIOSK #',
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 200,
          height: 30,
          child: Text(
            'Price',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildMenuItem('Beef Kare-kare', '₱ 50.00'),
        _buildMenuItem('Beef Steak', '₱ 50.00'),
        _buildMenuItem('Pork Sinigang', '₱ 50.00'),
        _buildMenuItem('Pork Nilaga', '₱ 50.00'),
        _buildMenuItem('Chicken Curry', '₱ 50.00'),
        _buildMenuItem('Grilled Fish', '₱ 20.00'),
        _buildMenuItem('Pork Barbeque', '₱ 15.00'),
        _buildMenuItem('Menudo', '₱ 50.00'),
      ],
    );
  }

  Widget _buildMenuItem(String name, String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              price,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 17,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
