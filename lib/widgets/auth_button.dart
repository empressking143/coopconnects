import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? icon; // Accept any widget, including FaIcon

  AuthButton({required this.text, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox.shrink(), // Use icon if passed, otherwise empty
      label: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFC95F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;

  const SocialButton({required this.onPressed, required this.icon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFC95F),
        fixedSize: const Size(65, 65), // Ensure a consistent circular size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.5), // Half of the size for a circular shape
        ),
        padding: EdgeInsets.zero, // Remove padding for better icon centering
      ),
      child: Center(child: icon), // Center the icon inside the button
    );
  }
}