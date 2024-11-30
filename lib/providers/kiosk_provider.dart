import 'package:flutter/material.dart';
import 'package:coopconnects/models/kiosk_model.dart';
import 'package:coopconnects/services/kiosk_service.dart';

class KioskProvider with ChangeNotifier {
  List<Kiosk> _kiosks = [];
  bool _isLoading = false;

  List<Kiosk> get kiosks => _kiosks;
  bool get isLoading => _isLoading;

  final KioskService _kioskService = KioskService();

  // Fetch kiosks data
  Future<void> fetchKiosks() async {
    _isLoading = true;
    notifyListeners();

    try {
      _kiosks = await _kioskService.fetchKiosks();
    } catch (error) {
      throw error; // Handle error appropriately
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
