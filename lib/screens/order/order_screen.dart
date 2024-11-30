import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  Widget buildMealCard({
    required String title,
    required String subtitle,
    required String description,
    required String price,
    required String imagePath,
    required String buttonText,
    required Color buttonColor,
  }) {
    return Column(
      children: [
        Container(
          width: double.infinity,  // Allow the container to take up full width
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x7F808080)),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 85,
                height: 85,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity, // Allow button to take up full width
          height: 40,
          decoration: ShapeDecoration(
            color: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 20), // Add spacing between cards
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20), // Add horizontal padding for centering
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  // Align items at the top
          crossAxisAlignment: CrossAxisAlignment.center, // Keep items centered horizontally
          children: [
            buildMealCard(
              title: 'Combo Meal 2 - Kiosk 3',
              subtitle: 'Ordered on August 5, 2024',
              description: 'Rice with Dinuguan and Iced Tea',
              price: '₱ 110.00',
              imagePath: 'assets/images/dinuguan.png',
              buttonText: 'Select items to reorder',
              buttonColor: const Color(0xFF800000),
            ),
            buildMealCard(
              title: 'Combo Meal 6 - Kiosk 4',
              subtitle: 'Ordered on August 5, 2024',
              description: 'Rice with Chicken Curry and Iced Tea',
              price: '₱ 120.00',
              imagePath: 'assets/images/chickencurry.png',
              buttonText: 'Select items to reorder',
              buttonColor: const Color(0xFF800000),
            ),
          ],
        ),
      ),
    );
  }
}
