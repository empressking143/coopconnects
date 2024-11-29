import 'package:coopconnects/models/menu_item_model.dart';

class MenuService {
  // Simulate fetching data (e.g., from an API or database)
  List<MenuItem> fetchMenuItems() {
    return [
      MenuItem(name: 'Beef Kare-kare', category: 'Beef Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Beef Steak', category: 'Beef Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Pork Sinigang', category: 'Pork Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Pork Nilaga', category: 'Pork Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Chicken Inasal', category: 'Chicken Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Chicken Curry', category: 'Chicken Dishes', price: '₱ 50.00'),
      MenuItem(name: 'Grilled Fish', category: 'Others', price: '₱ 50.00'),
      MenuItem(name: 'Combo Meal 1', category: 'Combo Meals', price: '₱ 75.00'),
      MenuItem(name: 'Iced Tea', category: 'Beverages', price: '₱ 15.00'),
      MenuItem(name: 'Pork Barbeque', category: 'Pork Dishes', price: '₱ 50.00'),
      // Add more items as needed
    ];
  }
}
