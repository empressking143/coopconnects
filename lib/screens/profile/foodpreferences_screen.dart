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
      backgroundColor: Color(0xFFFFF8E8), 
      appBar: AppBar(
        backgroundColor: Color(0xFF800000), 
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Align(
          alignment: Alignment.centerLeft, 
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
        centerTitle: false, 
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
                color: Color(0xFF800000), 
              ),
            ),
            SizedBox(height: 20), 
            Wrap(
              spacing: 16.0, 
              runSpacing: 16.0, 
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
                        : Color(0xFF800000), 
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Color(0xFF800000), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(0xFFD3D3D3)), 
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30), 

            Text(
              'Allergies',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF800000), 
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0, 
              runSpacing: 8.0, 
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
                        : Color(0xFF800000), 
                  ),
                  backgroundColor: Colors.white,
                  selectedColor: Color(0xFF800000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Color(0xFFD3D3D3)), 
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: ActionChip(
                label: Icon(Icons.add, color: Color(0xFF800000)),
                backgroundColor: Colors.white,
                onPressed: () {
                  print('Add new allergy');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Color(0xFFD3D3D3)), 
                ),
              ),
            ),
            Spacer(), 
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Selected Preferences: $selectedPreferences');
                  print('Selected Allergies: $selectedAllergies');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, 
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
