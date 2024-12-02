import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer
import 'login_screen.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  GradientIcon({required this.icon, this.size = 48.0});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const SweepGradient(
          center: Alignment.center,
          startAngle: 0.0,
          endAngle: 3.14 * 2, // Full circle
          colors: [
            Color(0xFF4285F4), // Blue
            Color(0xFF34A853), // Green
            Color(0xFFFBBC05), // Yellow
            Color(0xFFEA4335), // Red
          ],
          stops: [0.0, 0.25, 0.50, 0.75],
        ).createShader(bounds);
      },
      child: FaIcon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFF800000), // Dark red background
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 36),
                decoration: BoxDecoration(
                  color: const Color(0xFFB76E79),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(_usernameController, 'Username'),
                    const SizedBox(height: 15),
                    _buildTextField(_emailController, 'Email'),
                    const SizedBox(height: 15),
                    _buildTextField(_passwordController, 'Password', obscureText: true),
                    const SizedBox(height: 15),
                    // Email Sign-Up Button
                    AuthButton(
                      text: 'Sign Up',
                      onPressed: () {
                        authProvider.signUpWithEmail(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // "Already have an account? Log in" text with clickable "Log in"
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(milliseconds: 500), // Adjust duration for smoothness
                                    pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      // Define the slide transition (from right to left)
                                      const begin = Offset(1.0, 0.0); // Start from the right side
                                      const end = Offset.zero; // End at the current position
                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                                      var offsetAnimation = animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Add this before the social login Row
              const SizedBox(height: 20), // Adjust spacing as needed
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white60, // Divider color
                      thickness: 1, // Divider thickness
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or signup with',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white70,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Adjust spacing before social buttons

              const SizedBox(height: 10),
              // Social buttons with labels and modern design
              Column(
                children: [
                  // Google Button
                  ElevatedButton.icon(
                    icon: GradientIcon(
                      icon: FontAwesomeIcons.google,
                      size: 30.0,
                    ),
                    label: const Text(
                      'Continue with Google     ',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      authProvider.signUpWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFFFF), // Google Blue
                      minimumSize: Size(double.minPositive, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Facebook Button
                  ElevatedButton.icon(
                    icon: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: const Text(
                      'Continue with Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      authProvider.signUpWithFacebook();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1877F2), // Facebook Blue
                      minimumSize: Size(double.minPositive, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {bool obscureText = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}