import 'package:flutter/material.dart';

import 'add_receipt_screen.dart';
import 'consent_tracker_screen.dart';
import 'home_screen.dart';
import 'receipt_list_screen.dart';
import 'warranty_details_screen.dart';

void main() {
  runApp(const PrivacyVaultApp());
}

class PrivacyVaultApp extends StatelessWidget {
  const PrivacyVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Privacy Vault',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6750A4),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
