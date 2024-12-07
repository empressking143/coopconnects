import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    // Calculate subtotal
    final double subtotal = cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white), // Text color white
        ),
        backgroundColor: Color(0xFF800000), // Maroon background
        iconTheme: IconThemeData(color: Colors.white), // Back arrow color white
      ),
      body: cartItems.isEmpty
          ? Center(child: Text("Your cart is empty!"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50, height: 50),
                  title: Text(item.name),
                  subtitle: Text("₱${(item.price * item.quantity).toStringAsFixed(2)}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (item.quantity > 1) {
                            cartProvider.updateQuantity(item.name, item.quantity - 1);
                          }
                        },
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          cartProvider.updateQuantity(item.name, item.quantity + 1);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₱ ${subtotal.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Confirm order logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Order Confirmed!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC107),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  ),
                  child: const Text(
                    "Confirm Order",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
