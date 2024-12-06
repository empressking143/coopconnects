import 'package:coopconnects/screens/profile/AccountLoginIssues_screen.dart';
import 'package:coopconnects/screens/profile/AppIssues_screen.dart';
import 'package:coopconnects/screens/profile/PaymentIssues_screen.dart';
import 'package:coopconnects/screens/profile/SupportRequests_screen.dart';
import 'package:flutter/material.dart';
class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  // Define options for each dropdown and their respective screens
  final Map<String, List<Map<String, dynamic>>> _dropdownOptions = {
    'Get help with my orders': [
      {'title': 'Upcoming orders', 'screen': SupportRequestsScreen()},
      {'title': 'Past orders', 'screen': SupportRequestsScreen()},
    ],
    'I’m having trouble placing an order': [
      {'title': 'Account login issues', 'screen': AccountLoginIssuesPage()},
      {'title': 'Payment issues', 'screen': PaymentIssuesScreen()},
      {'title': 'App issues', 'screen': AppIssuesScreen()},
    ],
    'My support requests': [
      {'title': 'Requests', 'screen': SupportRequestsScreen()},
    ],
    'My Account': [
      {'title': 'Update Account information', 'screen': SupportRequestsScreen()},
      {'title': 'Delete my account', 'screen': SupportRequestsScreen()},
    ],
  };

  // Track the visibility and selected value for each dropdown
  final Map<String, String?> _selectedValues = {};
  final Map<String, bool> _dropdownVisibility = {};

  @override
  void initState() {
    super.initState();
    // Initialize dropdown visibility and selected values
    _dropdownOptions.forEach((key, value) {
      _selectedValues[key] = value.first['title']; // Initialize with the first option
      _dropdownVisibility[key] = false; // Initially hide dropdowns
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Perform the search query as you type
  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _navigateToScreen(String category, String value) {
    final screen = _dropdownOptions[category]!
        .firstWhere((option) => option['title'] == value)['screen'];
    
    // Ensure screen is not null before navigation
    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    } else {
      // Print a log message or show an error if screen is null
      print("Error: Screen is null for selected value: $value");
    }
  }

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
        title: Text(
          'Help Center',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFF800000),
      ),
      // Ensures the UI resizes when the keyboard is shown
      resizeToAvoidBottomInset: true, 
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How can we help?',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            _buildSearchBar(),
            SizedBox(height: 16),
            ..._dropdownOptions.keys.map((category) {
              return Column(
                children: [
                  _buildHelpOptionWithDropdown(
                    category,
                    _dropdownOptions[category]!
                        .where((option) => option['title']!
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()))
                        .toList(), // Filter options based on search
                    _selectedValues[category] ?? '',
                    (newValue) {
                      setState(() {
                        _selectedValues[category] = newValue;
                        _dropdownVisibility[category] = false;
                      });
                      _navigateToScreen(category, newValue);
                    },
                    _dropdownVisibility[category] ?? false,
                    () => setState(() {
                      _dropdownVisibility.forEach((key, _) {
                        _dropdownVisibility[key] = key == category
                            ? !_dropdownVisibility[key]!
                            : false;
                      });
                    }),
                  ),
                  if (_dropdownVisibility[category]!)
                    _buildDropdownList(
                      _dropdownOptions[category]!
                          .where((option) => option['title']!
                              .toLowerCase()
                              .contains(_searchQuery.toLowerCase()))
                          .toList(),
                      _selectedValues[category],
                      (newValue) {
                        setState(() {
                          _selectedValues[category] = newValue;
                          _dropdownVisibility[category] = false;
                        });
                        _navigateToScreen(category, newValue);
                      },
                    ),
                  SizedBox(height: 16),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xCC808080), width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.black54),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
              ),
              onChanged: _onSearchChanged, // Update search query on change
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpOptionWithDropdown(
    String title,
    List<Map<String, dynamic>> options,
    String selectedValue,
    Function(String) onChanged,
    bool isDropdownVisible,
    VoidCallback toggleDropdownVisibility,
  ) {
    return GestureDetector(
      onTap: toggleDropdownVisibility,
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFF800000).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.help_outline, color: Colors.white),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Icon(
              isDropdownVisible
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownList(
    List<Map<String, dynamic>> options,
    String? selectedValue,
    Function(String) onChanged,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: options.map((option) {
            return ListTile(
              title: Text(
                option['title'],
                style: TextStyle(color: Color(0xFF800000)),
              ),
              onTap: () => onChanged(option['title']),
            );
          }).toList(),
        ),
      ),
    );
  }
}
