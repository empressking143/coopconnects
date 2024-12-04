import 'package:flutter/material.dart';

class OtherLoginIssueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF800000), // AppBar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back button
          onPressed: () {
            Navigator.pop(context); // Navigate back on tap
          },
        ),
        titleSpacing: 0, // Removes extra space between back button and title
        title: Text(
          'Other Login Issue',
          style: TextStyle(
            color: Colors.white, // Title text color
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 2, // Adds slight shadow for the AppBar
      ),
      backgroundColor: Color(0xFFFFF8E8), // Page background color
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0), // Horizontal padding aligns with AppBar title
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0), // Add some spacing below the AppBar
            Text(
              "Couldn't find the answer to your account login issue?",
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Let us know by filling the form below and we will get back to you.",
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Poppins',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Your question',
                hintStyle: TextStyle(fontFamily: 'Poppins'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              ),
              maxLines: 5,
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
            Spacer(),
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
