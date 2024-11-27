import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/auth_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Signup Screen'),
            AuthButton(
              onPressed: () async {
                await authProvider.signupWithEmailPassword('email@example.com', 'password123');
                if (authProvider.isAuthenticated) {
                  Navigator.pushNamed(context, '/');
                }
              },
              text: 'Sign Up with Email',
            ),
          ],
        ),
      ),
    );
  }
}
