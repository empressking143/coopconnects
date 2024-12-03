import 'package:flutter/material.dart';
import 'SupportRequests_screen.dart'; // Import the SupportRequestsScreen

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  TextEditingController _searchController = TextEditingController();
  String? _selectedOrder = 'Upcoming orders';
  String? _selectedIssue = 'Account login issues';
  String? _selectedRequest = 'Requests';
  String? _selectedAccount = 'Update Account information';

  bool _isOrderDropdownVisible = false;
  bool _isIssueDropdownVisible = false;
  bool _isRequestDropdownVisible = false;
  bool _isAccountDropdownVisible = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      body: Padding(
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
            _buildHelpOptionWithDropdown(
              'Get help with my orders',
              ['Upcoming orders', 'Past orders'],
              _selectedOrder,
              (newValue) => setState(() {
                _selectedOrder = newValue;
              }),
              _isOrderDropdownVisible,
              () => setState(() {
                _isOrderDropdownVisible = !_isOrderDropdownVisible;
                _isIssueDropdownVisible = false;
                _isRequestDropdownVisible = false;
                _isAccountDropdownVisible = false;
              }),
            ),
            if (_isOrderDropdownVisible)
              _buildDropdownList(
                ['Upcoming orders', 'Past orders'],
                _selectedOrder,
                (newValue) => setState(() {
                  _selectedOrder = newValue;
                  _isOrderDropdownVisible = false;
                }),
              ),
            SizedBox(height: 16),
            _buildHelpOptionWithDropdown(
              'I’m having trouble placing an order',
              ['Account login issues', 'Payment issues', 'App issues'],
              _selectedIssue,
              (newValue) => setState(() {
                _selectedIssue = newValue;
              }),
              _isIssueDropdownVisible,
              () => setState(() {
                _isIssueDropdownVisible = !_isIssueDropdownVisible;
                _isOrderDropdownVisible = false;
                _isRequestDropdownVisible = false;
                _isAccountDropdownVisible = false;
              }),
            ),
            if (_isIssueDropdownVisible)
              _buildDropdownList(
                ['Account login issues', 'Payment issues', 'App issues'],
                _selectedIssue,
                (newValue) => setState(() {
                  _selectedIssue = newValue;
                  _isIssueDropdownVisible = false;
                }),
              ),
            SizedBox(height: 16),
            _buildHelpOptionWithDropdown(
              'My support requests',
              ['Requests'],
              _selectedRequest,
              (newValue) => setState(() {
                _selectedRequest = newValue;
              }),
              _isRequestDropdownVisible,
              () {
                setState(() {
                  _isRequestDropdownVisible = !_isRequestDropdownVisible;
                  _isOrderDropdownVisible = false;
                  _isIssueDropdownVisible = false;
                  _isAccountDropdownVisible = false;
                });
                // Navigate to SupportRequestsScreen when 'Requests' is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportRequestsScreen()),
                );
              },
            ),
            if (_isRequestDropdownVisible)
              _buildDropdownList(
                ['Requests'],
                _selectedRequest,
                (newValue) => setState(() {
                  _selectedRequest = newValue;
                  _isRequestDropdownVisible = false;
                }),
              ),
            SizedBox(height: 16),
            _buildHelpOptionWithDropdown(
              'My Account',
              ['Update Account information', 'Delete my account'],
              _selectedAccount,
              (newValue) => setState(() {
                _selectedAccount = newValue;
              }),
              _isAccountDropdownVisible,
              () => setState(() {
                _isAccountDropdownVisible = !_isAccountDropdownVisible;
                _isOrderDropdownVisible = false;
                _isIssueDropdownVisible = false;
                _isRequestDropdownVisible = false;
              }),
            ),
            if (_isAccountDropdownVisible)
              _buildDropdownList(
                ['Update Account information', 'Delete my account'],
                _selectedAccount,
                (newValue) => setState(() {
                  _selectedAccount = newValue;
                  _isAccountDropdownVisible = false;
                }),
              ),
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
                hintText: 'Press enter to search (Eg: "Account" & enter)',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                print('Searching for: $value');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpOptionWithDropdown(
    String title,
    List<String> options,
    String? selectedValue,
    Function(String?) onChanged,
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

  Widget _buildDropdownList(List<String> options, String? selectedValue, Function(String?) onChanged) {
    return Align(
      alignment: Alignment.centerRight,  // Align dropdown to the right
      child: Container(
        width: 250, // Width of the dropdown
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
          children: options.map((String value) {
            return ListTile(
              title: Text(
                value,
                style: TextStyle(color: Color(0xFF800000)),
              ),
              onTap: () {
                onChanged(value);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
