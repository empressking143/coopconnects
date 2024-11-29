// lib/providers/notification_provider.dart

import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> _notifications = [];

  // Getter for notifications
  List<NotificationModel> get notifications => _notifications;

  // Simulate fetching notifications (you can replace this with real data fetching logic)
  void fetchNotifications() {
    _notifications = [
      NotificationModel(
        title: 'Order Completed!',
        message: 'Your order ASDN39293U72 has been successfully completed on 9/28/2024. Kindly check the items and, if possible, share your feedback by providing a rating.',
      ),
      NotificationModel(
        title: 'Order Completed!',
        message: 'Your order LJSM29847T55 has been successfully completed. Kindly check the items and, if possible, share your feedback by providing a rating.',
      ),
      NotificationModel(
        title: 'Order Canceled.',
        message: 'Your order ZBCX54712P09 has been canceled on 9/25/2024. Payment will be reimbursed shortly.',
      ),
    ];
    notifyListeners();  // Notify the UI to update
  }

  // Mark a notification as read (this can be extended to update your data source)
  void markAsRead(int index) {
    _notifications[index].isRead = true;
    notifyListeners();
  }
}
