// lib/services/notification_service.dart

import 'package:coopconnects/models/notification_model.dart';

class NotificationService {
  List<NotificationModel> getNotifications() {
    // Sample static notifications
    return [
      NotificationModel(
        title: 'Order Completed!',
        message: 'Your order ASDN39293U72 has been successfully completed on 9/28/2024. Kindly check the items and, if possible, share your feedback by providing a rating.',
        time: '9/28/2024 10:00 AM',
      ),
      NotificationModel(
        title: 'Order Completed!',
        message: 'Your order LJSM29847T55 has been successfully completed. Kindly check the items and, if possible, share your feedback by providing a rating.',
        time: '9/28/2024 11:30 AM',
      ),
      NotificationModel(
        title: 'Order Canceled.',
        message: 'Your order ZBCX54712P09 has been canceled on 9/25/2024. Payment will be reimbursed shortly.',
        time: '9/25/2024 3:00 PM',
      ),
    ];
  }
}
