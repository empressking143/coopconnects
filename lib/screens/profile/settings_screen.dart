import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // State variables for the checkboxes
  bool _receivePushNotifications = false;
  bool _receiveOffersByEmail = false;
  bool _showFloatingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF8E8), // Background color
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back button color
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        titleSpacing: 0, // Moves title closer to the back button
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white, // Text color
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFF800000),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Notifications Settings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            NotificationOption(
              label: 'Receive push notifications',
              value: _receivePushNotifications,
              onChanged: (value) {
                setState(() {
                  _receivePushNotifications = value!;
                });
              },
            ),
            SizedBox(height: 16),
            NotificationOption(
              label: 'Receive offers by email',
              value: _receiveOffersByEmail,
              onChanged: (value) {
                setState(() {
                  _receiveOffersByEmail = value!;
                });
              },
            ),
            SizedBox(height: 16),
            NotificationOption(
              label: 'Show floating icon',
              value: _showFloatingIcon,
              onChanged: (value) {
                setState(() {
                  _showFloatingIcon = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationOption extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const NotificationOption({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: value ? Color(0xFF800000) : Colors.white, // Dynamic color
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0x7F808080), width: 1),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Checkbox(
          value: value, // Dynamic checkbox state
          activeColor: Colors.white, // Checkbox tick color
          checkColor: Color(0xFF800000), // Checkbox background color
          onChanged: onChanged, // Calls the callback when clicked
        ),
        title: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: value ? Colors.white : Colors.black.withOpacity(0.8), // Dynamic text color
          ),
        ),
      ),
    );
  }
}