import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopconnects/widgets/app_bar.dart';

class MenuDetailsScreen extends StatefulWidget {
  final String docId;

  MenuDetailsScreen({required this.docId});

  @override
  _MenuDetailsScreenState createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
  double price = 0.0;
  final ValueNotifier<int> quantityNotifier = ValueNotifier<int>(1); // Quantity wrapped in ValueNotifier

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
      appBar: AppBarWidget(),
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

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
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
                          const SizedBox(height: 100), // Space for scrolling
                        ],
                      ),
                    ),
                  ),
                ),

                // Fixed bottom section (like a navbar)
                Container(
                  color: Color(0xFFFFF8E8),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      // Subtotal Section
                      ValueListenableBuilder<int>(
                        valueListenable: quantityNotifier,
                        builder: (context, quantity, child) {
                          return Row(
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
                                "₱ ${(price * quantity).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF800000),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Quantity Selector and Add to Cart Button
                      QuantitySelector(
                        price: price,
                        quantityNotifier: quantityNotifier, // Pass the ValueNotifier
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final double price;
  final ValueNotifier<int> quantityNotifier;

  QuantitySelector({
    required this.price,
    required this.quantityNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  if (quantityNotifier.value > 1) {
                    quantityNotifier.value--; // Update the quantity
                  }
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: quantityNotifier,
                builder: (context, quantity, child) {
                  return Text(
                    "$quantity",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  quantityNotifier.value++; // Update the quantity
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
              // Add item to cart with updated quantity
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
    );
  }
}
