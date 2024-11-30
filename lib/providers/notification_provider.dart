// lib/providers/notification_provider.dart

import 'package:flutter/material.dart';
import 'package:coopconnects/services/notification_service.dart';
import 'package:coopconnects/models/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationService _notificationService = NotificationService();
  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  void loadNotifications() {
    _notifications = _notificationService.getNotifications();
    notifyListeners();
  }
}
