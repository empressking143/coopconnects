import 'package:flutter/material.dart';

class SupportRequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(
          'Support Requests',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFF800000),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            SizedBox(
              width: 340,
              height: 33,
              child: Text(
                'My support requests',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.39),
              child: Container(
                width: 224.64,
                height: 224.64,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.39),
                      child: Container(
                        width: 104.62,
                        padding: const EdgeInsets.only(top: 13.08),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 104.62,
                              height: 91.54,
                              child: Stack(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'All clear!',
              style: TextStyle(
                color: Color(0xFF800000),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Text(
              'You have no recent requests!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.800000011920929),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
