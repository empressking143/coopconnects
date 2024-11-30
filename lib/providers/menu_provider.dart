import 'package:flutter/material.dart';
import 'package:coopconnects/models/menu_item_model.dart';
import 'package:coopconnects/services/menu_service.dart';

class MenuProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;

  // Fetch menu items using the MenuService
  void fetchMenuItems() {
    _menuItems = MenuService().fetchMenuItems();
    notifyListeners();
  }
}
//remerge