import 'package:flutter/material.dart';
import 'package:coopconnects/models/menu_item_model.dart';
import 'package:coopconnects/services/menu_service.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];
  List<MenuItem> _filteredMenuItems = [];

  List<MenuItem> get menuItems => _filteredMenuItems.isEmpty ? _menuItems : _filteredMenuItems;

  // Fetch menu items using the MenuService (with async)
  Future<void> fetchMenuItems() async {
    try {
      _menuItems = await MenuService().fetchMenuItems();
      _filteredMenuItems = []; // Reset filtered items
      notifyListeners();
    } catch (e) {
      print('Error loading menu items: $e');
    }
  }

  // Method to filter menu items based on category
  void filterMenuItems(String selectedCategory) {
    if (selectedCategory == 'All') {
      _filteredMenuItems = [];
    } else {
      _filteredMenuItems = _menuItems
          .where((item) => item.category == selectedCategory)
          .toList();
    }
    notifyListeners();
  }

  // Method to update menu items directly (useful for sorting or other custom updates)
  void updateMenuItems(List<MenuItem> items) {
    _menuItems = items;
    _filteredMenuItems = [];
    notifyListeners();
  }
}
