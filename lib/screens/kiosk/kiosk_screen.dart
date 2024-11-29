// screens/kiosk/kiosk_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/kiosk_model.dart';
import '../../providers/kiosk_provider.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the column's children
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
                        return KioskCard(kioskName: kiosk.name);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
