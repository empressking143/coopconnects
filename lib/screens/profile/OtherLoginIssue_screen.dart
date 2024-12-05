import 'package:flutter/material.dart';

class OtherLoginIssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF800000), 
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), 
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        titleSpacing: 0, 
        title: Text(
          'Other Login Issue',
          style: TextStyle(
            color: Colors.white, 
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 2,
      ),
      backgroundColor: Color(0xFFFFF8E8), 
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            SizedBox(height: 16.0), 
            SizedBox(
              width: 338, 
              child: Text(
                "Couldn't find the answer to your account login issue?",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              width: 338, 
              child: Text(
                "Let us know by filling the form below and we will get back to you.",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity, 
              height: 150,
              decoration: ShapeDecoration(
                color: Color(0x99D9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Your question',
                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Upload image functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(Icons.image, color: Colors.grey),
                  label: Text(
                    'Upload an image',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              "⚠️ Make sure no personal information like ID's or other sensitive information is in this photo before sending.",
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.red,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 24.0), 
            SizedBox(
              width: double.infinity, 
              child: ElevatedButton(
                onPressed: () {
                  // Send message functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF800000),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Send Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
