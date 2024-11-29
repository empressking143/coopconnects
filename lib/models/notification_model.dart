// lib/models/notification_model.dart

class NotificationModel {
  final String title;
  final String message;
  bool isRead;

  NotificationModel({
    required this.title,
    required this.message,
    this.isRead = false,  // Default value is false (unread)
  });
}
