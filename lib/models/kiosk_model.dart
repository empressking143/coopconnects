class Kiosk {
  final String id;
  final String name;
  final String location; // Example additional field

  Kiosk({
    required this.id,
    required this.name,
    required this.location,
  });

  factory Kiosk.fromJson(Map<String, dynamic> json) {
    return Kiosk(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
