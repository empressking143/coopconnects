import 'package:flutter/material.dart';
import '/models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  void addItem(CartItemModel item) {
    final index = _items.indexWhere((existingItem) => existingItem.name == item.name);
    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(String itemName, int quantity) {
    final index = _items.indexWhere((item) => item.name == itemName);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
    }
  }

  void removeItem(String itemName) {
    _items.removeWhere((item) => item.name == itemName);
    notifyListeners();
  }
}
