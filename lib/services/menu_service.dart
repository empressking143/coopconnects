import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopconnects/models/menu_item_model.dart';

class MenuService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch all menu items from Firestore
  Future<List<MenuItem>> fetchMenuItems() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('menuItems').get();
      return snapshot.docs.map((doc) {
        return MenuItem.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching menu items: $e');
      return []; // Return an empty list on error
    }
  }

  // Fetch a single menu item by ID
  Future<MenuItem?> fetchMenuItemById(String itemId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('menuItems').doc(itemId).get();
      if (doc.exists) {
        return MenuItem.fromJson(doc.id, doc.data() as Map<String, dynamic>);
      } else {
        return null; // Item not found
      }
    } catch (e) {
      print('Error fetching menu item: $e');
      return null; // Handle errors gracefully
    }
  }
}
