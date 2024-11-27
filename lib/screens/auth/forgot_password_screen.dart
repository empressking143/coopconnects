import 'package:flutter/material.dart';
import 'package:coopconnects/services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await AuthService().resetPassword(_emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Password reset link sent!')),
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
