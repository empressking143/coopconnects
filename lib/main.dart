import 'package:coopconnects/screens/profile/AppIssues_screen.dart';
import 'package:coopconnects/screens/profile/AvailablePaymentMethods_screen.dart';
import 'package:coopconnects/screens/profile/CantSignup_Screen.dart';
import 'package:coopconnects/screens/profile/GetHelpWithOrders_screen.dart';
import 'package:coopconnects/screens/profile/NumberRegistered_screen.dart';
import 'package:coopconnects/screens/profile/OtherLoginIssue_screen.dart';
import 'package:coopconnects/screens/profile/PaymentIssues_screen.dart';
import 'package:coopconnects/screens/profile/TroubleWithCheckout_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/kiosk_provider.dart';
import 'providers/menu_provider.dart';
import 'providers/notification_provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/kiosk/kiosk_screen.dart';
import 'screens/notification/notification_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'providers/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => KioskProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFF8E8),
      ),
      home: HomeScreen(),
      routes: {
        '/notifications': (context) => NotificationScreen(),
        '/kiosk': (context) => KioskScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
