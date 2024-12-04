 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuDetailsScreen extends StatefulWidget {
  final String docId;

  MenuDetailsScreen({required this.docId});

  @override
  _MenuDetailsScreenState createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
  int quantity = 1;
  double price = 0.0;

  Future<Map<String, dynamic>> fetchMenuItem() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('menuItems')
        .doc(widget.docId)
        .get();
    return docSnapshot.data() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF800000),
        title: const Text("Order", style: TextStyle(fontFamily: 'Poppins')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchMenuItem(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading details."));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Menu item not found."));
          } else {
            final menuItem = snapshot.data!;
            // Initialize the price
            if (price == 0.0) {
              price = double.tryParse(menuItem['price'].toString()) ?? 0.0;
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menu Item Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        menuItem['imageUrl'] ?? '',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image, size: 200),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Menu Item Name
                    Text(
                      menuItem['name'] ?? 'No name',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Color(0xFF800000),
                      ),
                    ),
                    const SizedBox(height: 5),

                    // Menu Item Description
                    Text(
                      menuItem['details'] ?? 'No description available',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Key Ingredients Section
                    const Text(
                      "Key Ingredients:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xFF800000),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      menuItem['ingredients'] ?? 'No ingredients available',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Allergen Warning
                    if (menuItem['allergens'] != null)
                      Text(
                        "Allergen Warning: ${menuItem['allergens']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: Colors.red,
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Subtotal Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF800000),
                          ),
                        ),
                        Text(
                          "₱${(price * quantity).toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF800000),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Add to Cart Section
                    Row(
                      children: [
                        // Quantity Selector
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF800000),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                    });
                                  }
                                },
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),

                        // Add to Cart Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add item to cart
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFC107),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
