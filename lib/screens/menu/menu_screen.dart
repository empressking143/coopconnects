import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/app_bar.dart'; // Import the custom AppBar
import 'package:coopconnects/widgets/nav_bar.dart'; // Import the custom NavBar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF8E8), // Set the background color to #FFF8E8
        primarySwatch: Colors.red, 
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = 'All';  // Default category
  List<Map<String, String>> menuItems = [  // Menu data with categories
    {'name': 'Beef Kare-kare', 'price': '₱ 50.00', 'category': 'Beef Dishes'},
    {'name': 'Beef Steak', 'price': '₱ 50.00', 'category': 'Beef Dishes'},
    {'name': 'Pork Sinigang', 'price': '₱ 50.00', 'category': 'Pork Dishes'},
    {'name': 'Pork Nilaga', 'price': '₱ 50.00', 'category': 'Pork Dishes'},
    {'name': 'Chicken Curry', 'price': '₱ 50.00', 'category': 'Chicken Dishes'},
    {'name': 'Grilled Fish', 'price': '₱ 20.00', 'category': 'Others'},
    {'name': 'Pork Barbeque', 'price': '₱ 15.00', 'category': 'Pork Dishes'},
    {'name': 'Menudo', 'price': '₱ 50.00', 'category': 'Pork Dishes'},
  ];

  // Categories list for the dropdown
  final List<String> categories = [
    'All',
    'Rice Meals',
    'Pork Dishes',
    'Chicken Dishes',
    'Beef Dishes',
    'Beverages',
    'Combo Meals',
    'Others',
  ];

  // Function to filter items by selected category
  List<Map<String, String>> get filteredMenu {
    if (selectedCategory == 'All') {
      return menuItems;
    }
    return menuItems.where((item) => item['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Background color
      appBar: AppBarWidget(),  // Use your custom AppBar
      bottomNavigationBar: NavBar(), // Use your custom NavBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
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
                // Sorting Dropdown
                Row(
                  children: [
                    Text(
                      'Sort: ',
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    DropdownButton<String>(
                      value: selectedCategory,
                      icon: Icon(Icons.arrow_drop_down, color: Color(0xFF800000)),
                      dropdownColor: Color(0xFFFFF8E8),
                      style: TextStyle(
                        color: Color(0xFF800000),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                      underline: Container(height: 2, color: Color(0xFF800000)),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      items: categories.map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            // Menu Items List
            Expanded(
              child: ListView.builder(
                itemCount: filteredMenu.length,
                itemBuilder: (context, index) {
                  return _buildMenuItem(filteredMenu[index]['name']!, filteredMenu[index]['price']!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String name, String price) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          Text(
            name,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF800000),
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
