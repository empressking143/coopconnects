import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 117,
          height: 30,
          child: Text(
            'KIOSK #',
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
        SizedBox(
          width: 82,
          height: 30,
          child: Text(
            'Price',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
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
    return Column(
      children: [
        Container(
          width: 238,
          height: 41,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        SizedBox(
          width: 146,
          height: 29,
          child: Text(
            name,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        SizedBox(
          width: 146,
          height: 27,
          child: Text(
            price,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
