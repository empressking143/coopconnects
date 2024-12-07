import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopconnects/widgets/app_bar.dart';
import 'package:coopconnects/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '/models/cart_model.dart';

class MenuDetailsScreen extends StatefulWidget {
  final String docId;

  MenuDetailsScreen({required this.docId});

  @override
  _MenuDetailsScreenState createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
  double price = 0.0;
  final ValueNotifier<int> quantityNotifier = ValueNotifier<int>(1);

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
        title: Text(
          'Menu Details',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF800000), // Maroon background
        iconTheme: IconThemeData(color: Colors.white), // Back arrow color white
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
                          Text(
                            menuItem['details'] ?? 'No description available',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 20),
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
                          if (menuItem['allergens'] != null)
                            Text(
                              "Allergen Warning: ${menuItem['allergens']}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Colors.red,
                              ),
                            ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xFFFFF8E8),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      ValueListenableBuilder<int>(
                        valueListenable: quantityNotifier,
                        builder: (context, quantity, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Subtotal",
                                style: TextStyle(
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
                      QuantitySelector(
                        price: price,
                        quantityNotifier: quantityNotifier,
                        onAddToCart: () {
                          final cartProvider =
                              Provider.of<CartProvider>(context, listen: false);

                          cartProvider.addItem(CartItemModel(
                            name: menuItem['name'] ?? 'No name',
                            imageUrl: menuItem['imageUrl'] ?? '',
                            price: price,
                            quantity: quantityNotifier.value,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Item added to cart!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
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
  final VoidCallback onAddToCart;

  QuantitySelector({
    required this.price,
    required this.quantityNotifier,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                    quantityNotifier.value--;
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
                  quantityNotifier.value++;
                },
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ElevatedButton(
            onPressed: onAddToCart,
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
