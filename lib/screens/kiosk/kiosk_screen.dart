import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/kiosk_model.dart';
import '../../providers/kiosk_provider.dart';
import 'package:coopconnects/widgets/app_bar.dart';
import 'package:coopconnects/widgets/nav_bar.dart';
import 'package:coopconnects/screens/menu/menu_screen.dart'; // Import the menu screen

class KioskScreen extends StatefulWidget {
  @override
  _KioskScreenState createState() => _KioskScreenState();
}

class _KioskScreenState extends State<KioskScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch kiosks when the screen is initialized
    Provider.of<KioskProvider>(context, listen: false).fetchKiosks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Set background color
      appBar: AppBarWidget(), // Remove the app bar
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0), // Add vertical padding to the body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align the column's children at the start
          crossAxisAlignment: CrossAxisAlignment.center, // Center the column's children horizontally
          children: [
            SizedBox(
              width: 90,
              height: 30,
              child: Text(
                'KIOSK',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF800000),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 20), // Add some spacing between the text and the grid
            Expanded(
              child: Consumer<KioskProvider>(
                builder: (context, kioskProvider, child) {
                  if (kioskProvider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return Center(
                    child: Container(
                      width: 371,
                      height: 624,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 170 / 185,
                        ),
                        itemCount: kioskProvider.kiosks.length,
                        itemBuilder: (context, index) {
                          Kiosk kiosk = kioskProvider.kiosks[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the menu screen when a kiosk is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MenuScreen(), // Navigate directly to MenuScreen
                                ),
                              );
                            },
                            child: KioskCard(kioskName: 'Kiosk ${index + 1}'),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class KioskCard extends StatelessWidget {
  final String kioskName;

  KioskCard({required this.kioskName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 185,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: Text(
          kioskName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF800000),
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
    );
  }
}