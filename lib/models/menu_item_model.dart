class MenuItem {
  final String id;          // Ensure 'id' is required
  final String name;
  final String price;
  final String ingredients;
  final String allergens;
  final String imageUrl;
  final String category;
  final String details;     // Add 'details' if it's required elsewhere

  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.ingredients,
    required this.allergens,
    required this.imageUrl,
    required this.category,
    required this.details, // Ensure this field exists and matches Firestore
  });

  // Factory method to convert Firestore data to a MenuItem instance
  factory MenuItem.fromJson(String docId, Map<String, dynamic> json) {
    return MenuItem(
      id: docId, // Extract Firestore document ID
      name: json['name'] ?? '',
      price: json['price'] ?? '',
      ingredients: json['ingredients'] ?? '',
      allergens: json['allergens'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      category: json['category'] ?? '',
      details: json['details'] ?? '', // Add a field for 'details' if needed
    );
  }
}
