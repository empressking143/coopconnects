import 'package:coopconnects/screens/profile/AppIssues_screen.dart';
import 'package:coopconnects/screens/profile/AvailablePaymentMethods_screen.dart';
import 'package:coopconnects/screens/profile/CantSignup_Screen.dart';
import 'package:coopconnects/screens/profile/GetHelpWithOrders_screen.dart';
import 'package:coopconnects/screens/profile/NumberRegistered_screen.dart';
import 'package:coopconnects/screens/profile/OtherLoginIssue_screen.dart';
import 'package:coopconnects/screens/profile/PaymentIssues_screen.dart';
import 'package:coopconnects/screens/profile/TroubleWithCheckout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/kiosk/kiosk_screen.dart'; 
import 'providers/kiosk_provider.dart';  
import 'screens/profile/profile_screen.dart'; 
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => KioskProvider(), // Keep the KioskProvider setup
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoopConnects',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(), // Set ProfileScreen as the main screen
      debugShowCheckedModeBanner: false,
    );
  }
}
