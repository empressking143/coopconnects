import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import the profile_screen.dart

class FavoritesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {
      "title": "Chicken Curry",
      "description": "Chicken Curry stewed in coconut milk and curry spices.",
      "price": "₱ 50.00",
      "kiosk": "Kiosk 8",
      "image": "assets/images/advertisement3.png",
    },
    {
      "title": "Beef Kare-kare",
      "description": "Savory Beef stew in peanut butter sauce.",
      "price": "₱ 50.00",
      "kiosk": "Kiosk 8",
      "image": "assets/images/beef-kare-kare.jpg",
    },
    {
      "title": "Pork Sinigang",
      "description": "Made with pork ribs, vegetables, and tamarind-flavored broth.",
      "price": "₱ 50.00",
      "kiosk": "Kiosk 8",
      "image": "assets/images/advertisement2.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8),
      appBar: AppBar(
        backgroundColor: Color(0xFF800000),
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 4,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          item['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(
                                  color: Color(0xFF800000),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['description'],
                                style: TextStyle(
                                  color: Color(0xFF800000),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                item['price'],
                                style: TextStyle(
                                  color: Color(0xFF800000),
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                item['kiosk'],
                                style: TextStyle(
                                  color: Color(0x7F800000),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(height: 25), 
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Color(0xFF800000),
                              ),
                              onPressed: () {
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20), 
            child: Container(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add New Favorite',
                  style: TextStyle(
                    color: Color(0xFF800000),
                    fontSize: 20,
                    fontWeight: FontWeight.w600, 
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}