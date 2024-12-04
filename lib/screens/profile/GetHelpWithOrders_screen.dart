import 'package:flutter/material.dart';

class GethelpwithordersScreen extends StatefulWidget {
  @override
  _UpcomingOrdersScreenState createState() => _UpcomingOrdersScreenState();
}

class _UpcomingOrdersScreenState extends State<GethelpwithordersScreen> {
  bool isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Get help with my orders',
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            color: Colors.white, // Set the color of the title to white
          ),
        ),
        titleSpacing: 0, // Adjust spacing for better alignment
        backgroundColor: const Color(0xFF800000),
      ),
      body: Column(
        children: [
          // Tab bar for navigation
          Container(
            color: Colors.white,
            height: 46,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isUpcomingSelected = true;
                      });
                    },
                    child: Text(
                      'Upcoming Orders',
                      style: TextStyle(
                        color: isUpcomingSelected ? Colors.black : Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  width: 1,
                  height: 30,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isUpcomingSelected = false;
                      });
                    },
                    child: Text(
                      'Past Orders',
                      style: TextStyle(
                        color: !isUpcomingSelected ? Colors.black : Colors.grey,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: isUpcomingSelected
                ? ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      _buildOrderCard(
                        imageUrl: 'https://via.placeholder.com/118x118',
                        title: 'Chicken Curry, Rice',
                        kiosk: 'Kiosk 8',
                        price: '₱ 65.00',
                        dateTime: '9/18/2024, 11:30 AM',
                        itemsCount: '2 items',
                      ),
                      const SizedBox(height: 16),
                      _buildOrderCard(
                        imageUrl: 'https://via.placeholder.com/118x118',
                        title: 'Beef Kare-kare, Rice, Drink',
                        kiosk: 'Kiosk 8',
                        price: '₱ 85.00',
                        dateTime: '9/24/2024, 12:30 PM',
                        itemsCount: '3 items',
                      ),
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.history,
                          size: 80,
                          color: Colors.black54,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No past orders found!',
                          style: TextStyle(
                            color: Color(0xFF800000),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Your past orders will appear here.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  // Order Card Widget (for Upcoming Orders)
  Widget _buildOrderCard({
    required String imageUrl,
    required String title,
    required String kiosk,
    required String price,
    required String dateTime,
    required String itemsCount,
  }) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Food Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF800000),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  kiosk,
                  style: const TextStyle(
                    color: Color(0x7F800000),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF800000),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Right side details (items count + date)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                itemsCount,
                style: const TextStyle(
                  color: Color(0xFF800000),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                dateTime,
                style: const TextStyle(
                  color: Color(0x7F800000),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
