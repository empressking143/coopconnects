import 'package:flutter/material.dart';

class ContactSupport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Set background color here
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Symmetrical padding for consistent spacing
        child: Column(
          children: [
            // Upper contact form section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0x7F808080)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We’d love to hear from you!\nLet’s get in touch',
                    style: TextStyle(
                      color: Color(0xFF800000),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0x7F808080)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Colors.black.withOpacity(0.5), size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Chacha@gmail.com',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your Message',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 145,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0x7F808080)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      'Type your message here',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 115,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Color(0xFF800000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Send Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // Lower contact information section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0x7F808080)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Not sure what you need? Our team at Coop Connects will be happy to listen to you and your suggestions.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.black.withOpacity(0.7), size: 18),
                      SizedBox(width: 8),
                      Text(
                        'contact.support@coopconnects.com',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.black.withOpacity(0.7), size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Support: +639452386415',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
