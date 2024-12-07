// lib/widgets/notification_button.dart

import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  NotificationButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
