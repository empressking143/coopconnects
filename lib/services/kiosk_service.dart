// services/kiosk_service.dart
import '../models/kiosk_model.dart';

class KioskService {
  // Sample data, replace this with real data fetching logic (e.g., from an API or database)
  List<Kiosk> getKiosks() {
    return [
      Kiosk(name: 'KIOSK 1', id: '1', isAvailable: true),
      Kiosk(name: 'KIOSK 2', id: '2', isAvailable: false),
      Kiosk(name: 'KIOSK 3', id: '3', isAvailable: true),
      Kiosk(name: 'KIOSK 4', id: '4', isAvailable: true),
      Kiosk(name: 'KIOSK 5', id: '5', isAvailable: false),
      Kiosk(name: 'KIOSK 6', id: '6', isAvailable: true),
    ];
  }

  // Example search method (filtering by availability)
  List<Kiosk> searchKiosks({bool? isAvailable}) {
    return getKiosks().where((kiosk) {
      if (isAvailable != null) {
        return kiosk.isAvailable == isAvailable;
      }
      return true;
    }).toList();
  }
}
