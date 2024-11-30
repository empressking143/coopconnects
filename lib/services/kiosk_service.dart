import 'package:coopconnects/models/kiosk_model.dart';

class KioskService {
  Future<List<Kiosk>> fetchKiosks() async {
    // Simulate a network call or database query to fetch kiosks
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay

    // Return a dummy list of kiosks
    return [
      Kiosk(id: '1', name: 'Kiosk 1', location: 'Ground Floor'),
      Kiosk(id: '2', name: 'Kiosk 2', location: 'Second Floor'),
      Kiosk(id: '3', name: 'Kiosk 3', location: 'Third Floor'),
      Kiosk(id: '4', name: 'Kiosk 4', location: 'Third Floor'),
      Kiosk(id: '5', name: 'Kiosk 5', location: 'Third Floor'),
      Kiosk(id: '6', name: 'Kiosk 6', location: 'Third Floor'),
      Kiosk(id: '7', name: 'Kiosk 7', location: 'Third Floor'),
      // Add more kiosks as needed
    ];
  }
}
