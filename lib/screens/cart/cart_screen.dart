import 'package:flutter/material.dart';
import 'package:coopconnects/widgets/app_bar.dart';
import 'package:coopconnects/widgets/nav_bar.dart';
// import 'order_confirmation_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> itemQuantities = [1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Color(0xFFFFF7E8),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CartItem(
              itemNumber: 1,
              itemName: 'Chicken Curry',
              imageUrl: 'assets/images/Chicken Curry.jpg',
              quantity: itemQuantities[0],
              onQuantityChanged: (newQuantity) {
                setState(() {
                  itemQuantities[0] = newQuantity;
                });
              },
            ),
            CartItem(
              itemNumber: 2,
              itemName: 'Dinuguan',
              imageUrl: 'assets/images/Dinuguan.jpg',
              quantity: itemQuantities[1],
              onQuantityChanged: (newQuantity) {
                setState(() {
                  itemQuantities[1] = newQuantity;
                });
              },
            ),
            CartItem(
              itemNumber: 3,
              itemName: 'Beef Kare-kare',
              imageUrl: 'assets/images/Kare-kare.jpg',
              quantity: itemQuantities[2],
              onQuantityChanged: (newQuantity) {
                setState(() {
                  itemQuantities[2] = newQuantity;
                });
              },
            ),
            Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => OrderConfirmationScreen()),
                  // );

                  print('Order Confirmed!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC95F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Confirm Order',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class CartItem extends StatelessWidget {
  final int itemNumber;
  final String itemName;
  final String imageUrl;
  final int quantity;
  final ValueChanged<int> onQuantityChanged;

  CartItem({
    required this.itemNumber,
    required this.itemName,
    required this.imageUrl,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            'Item $itemNumber',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF800000),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 160,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Text(
                itemName,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF800000),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        onQuantityChanged(quantity - 1);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Icon(Icons.remove, size: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      onQuantityChanged(quantity + 1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Icon(Icons.add, size: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}