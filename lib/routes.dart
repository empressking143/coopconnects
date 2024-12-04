import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/kiosk_search_screen.dart';
import 'screens/menu/menu_screen.dart';
import 'screens/menu/menu_detail_screen.dart';
import 'screens/order/order_screen.dart';
import 'screens/order/order_code.dart';
import 'screens/order/order_confirmation_screen.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/kiosk/kiosk_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String forgotPasswordScreen = '/forgot-password';
  static const String homeScreen = '/home';
  static const String kioskSearchScreen = '/kiosk-search';
  static const String menuScreen = '/menu';
  static const String menuFilterScreen = '/menu-filter';
  static const String orderScreen = '/order';
  static const String orderDetailScreen = '/order-detail';
  static const String orderConfirmationScreen = '/order-confirmation';
  static const String cartScreen = '/cart';
  static const String profileScreen = '/profile';
  static const String notificationScreen = '/notifications';
  static const String kioskScreen = '/kiosk';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case kioskSearchScreen:
        return MaterialPageRoute(builder: (_) => KioskSearchScreen());
      case menuScreen:
        return MaterialPageRoute(builder: (_) => MenuScreen());
      case menuFilterScreen:
        return MaterialPageRoute(builder: (_) => MenuFilterScreen());
      case orderScreen:
        return MaterialPageRoute(builder: (_) => OrderScreen());
      case orderDetailScreen:
        return MaterialPageRoute(builder: (_) => OrderDetailScreen());
      case orderConfirmationScreen:
        return MaterialPageRoute(builder: (_) => OrderConfirmationScreen());
      case cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case kioskScreen:
        return MaterialPageRoute(builder: (_) => KioskScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
