// providers/kiosk_provider.dart
import 'package:flutter/material.dart';
import '../models/kiosk_model.dart';
import '../services/kiosk_service.dart';

class KioskProvider with ChangeNotifier {
  final KioskService _kioskService = KioskService();
  List<Kiosk> _kiosks = [];

  List<Kiosk> get kiosks => _kiosks;

  // Fetch all kiosks
  void fetchKiosks() {
    _kiosks = _kioskService.getKiosks();
    notifyListeners();
  }

  // Search for available kiosks
  void searchAvailableKiosks() {
    _kiosks = _kioskService.searchKiosks(isAvailable: true);
    notifyListeners();
  }
}
