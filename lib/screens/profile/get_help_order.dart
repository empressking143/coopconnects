import 'package:flutter/material.dart';

class GetHelpOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Only vertical padding for the scroll view
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chicken Curry Order
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Space left and right
                child: OrderCard(
                  imageUrl:
                      'assets/images/help2.png', // Replace with actual image URL
                  title: 'Chicken Curry, Rice',
                  kiosk: 'Kiosk B',
                  items: '2 items',
                  price: '₱ 65.00',
                  date: '9/18/2024, 11:30 AM',
                ),
              ),
              const SizedBox(height: 16),
              // Beef Kare-kare Order
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Space left and right
                child: OrderCard(
                  imageUrl:
                      'assets/images/help1.png', // Replace with actual image URL
                  title: 'Beef Kare-kare, Rice, Drink',
                  kiosk: 'Kiosk B',
                  items: '3 items',
                  price: '₱ 85.00',
                  date: '9/24/2024, 12:30 PM',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String kiosk;
  final String items;
  final String price;
  final String date;

  const OrderCard({
    required this.imageUrl,
    required this.title,
    required this.kiosk,
    required this.items,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
      ),
      child: Row(
        children: [
          // Image Section
          Container(
            width: 118,
            height: 118,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF800000),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    kiosk,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items,
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          color: Color(0xFF800000),
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Date and Price Section Positioned at the Lower Right
          Positioned(
            bottom: 8,
            right: 8,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Date Text
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8), // Space between date and price
                // Price Text
                Text(
                  price,
                  style: TextStyle(
                    color: Color(0xFF800000),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
