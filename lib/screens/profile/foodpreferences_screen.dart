import 'package:flutter/material.dart';

class FoodPreferencesScreen extends StatefulWidget {
  @override
  _FoodPreferencesScreenState createState() => _FoodPreferencesScreenState();
}

class _FoodPreferencesScreenState extends State<FoodPreferencesScreen> {
  // Manage state for preferences and allergies
  List<String> preferences = [
    "Gluten Free",
    "Lactose Free",
    "Vegetarian",
    "Organic"
  ];
  List<String> allergies = [
    "Egg",
    "Wheat",
    "Peanuts",
    "Soy",
    "Sesame",
    "Tree Nuts"
  ];

  Set<String> selectedPreferences = {};
  Set<String> selectedAllergies = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Light beige background
      appBar: AppBar(
        backgroundColor: Color(0xFF800000), // Maroon color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Align(
          alignment: Alignment.centerLeft, // Aligns the title closer to the back button
          child: Text(
            'Food Preferences',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: false, // Centers the title only when needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Preferences Section
            Text(
              'Preferences',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF800000), // Maroon color
              ),
            ),
            SizedBox(height: 20), // Increased space between the title and the choices
            Wrap(
              spacing: 16.0, // Increased space between chips
              runSpacing: 16.0, // Increased space between rows
              children: preferences.map((preference) {
                return ChoiceChip(
                  label: Text(preference),
                  selected: selectedPreferences.contains(preference),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedPreferences.add(preference);
                      } else {
                        selectedPreferences.remove(preference);
                      }
                    });
                  },
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: selectedPreferences.contains(preference)
                        ? Colors.white
                        : Color(0xFF800000), // Maroon color
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Color(0xFF800000), // Maroon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(0xFFD3D3D3)), // Light greyish color
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30), // Increased space between Preferences and Allergies sections

            // Allergies Section
            Text(
              'Allergies',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF800000), // Maroon color
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0, // Space between chips
              runSpacing: 8.0, // Space between rows
              children: allergies.map((allergy) {
                return ChoiceChip(
                  label: Text(allergy),
                  selected: selectedAllergies.contains(allergy),
                  onSelected: (isSelected) {
                    setState(() {
                      if (isSelected) {
                        selectedAllergies.add(allergy);
                      } else {
                        selectedAllergies.remove(allergy);
                      }
                    });
                  },
                  labelStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: selectedAllergies.contains(allergy)
                        ? Colors.white
                        : Color(0xFF800000), // Maroon color
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Color(0xFF800000), // Maroon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(0xFFD3D3D3)), // Light greyish color
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Add Allergies Button
            Align(
              alignment: Alignment.centerLeft,
              child: ActionChip(
                label: Icon(Icons.add, color: Color(0xFF800000)),
                backgroundColor: Colors.white,
                onPressed: () {
                  // Add allergies functionality (placeholder)
                  print('Add new allergy');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFFD3D3D3)), // Light greyish color
                ),
              ),
            ),
            Spacer(), // Pushes the button to the bottom
            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save preferences and allergies logic
                  print('Selected Preferences: $selectedPreferences');
                  print('Selected Allergies: $selectedAllergies');

                  // Navigate back to the profile screen
                  Navigator.pop(context); // This goes back to the previous screen (profile_screen.dart)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Maroon color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Save Preferences',
                  style: TextStyle(
                    color: Color(0xFF800000),
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
