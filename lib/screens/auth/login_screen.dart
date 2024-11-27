// login_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login Screen'),
            ElevatedButton(
              onPressed: () async {
                final authProvider = Provider.of<AuthProvider>(context, listen: false);
                await authProvider.loginWithEmailPassword('email@example.com', 'password123');
                if (authProvider.isAuthenticated) {
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const Text('Login with Email'),
            ),
          ],
        ),
      ),
    );
  }
}
