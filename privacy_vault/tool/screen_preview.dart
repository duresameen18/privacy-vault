import 'package:flutter/material.dart';

import 'package:privacy_vault/add_receipt_screen.dart';
import 'package:privacy_vault/consent_tracker_screen.dart';
import 'package:privacy_vault/home_screen.dart';
import 'package:privacy_vault/receipt_list_screen.dart';
import 'package:privacy_vault/warranty_details_screen.dart';

void main() {
  final screen = switch (Uri.base.queryParameters['screen']) {
    'receipts' => const ReceiptListScreen(),
    'add-receipt' => const AddReceiptScreen(),
    'warranty' => const WarrantyDetailsScreen(),
    'privacy' => const ConsentTrackerScreen(),
    _ => const HomeScreen(),
  };

  runApp(
    MaterialApp(
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
      home: screen,
    ),
  );
}
