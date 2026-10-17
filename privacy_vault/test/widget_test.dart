import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:privacy_vault/add_receipt_screen.dart';
import 'package:privacy_vault/consent_tracker_screen.dart';
import 'package:privacy_vault/home_screen.dart';
import 'package:privacy_vault/receipt_list_screen.dart';
import 'package:privacy_vault/warranty_details_screen.dart';

Widget _screenApp(Widget screen) {
  return MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF6750A4),
        foregroundColor: Colors.white,
      ),
    ),
    home: screen,
  );
}

void main() {
  testWidgets('home screen renders', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_screenApp(const HomeScreen()));

    expect(find.text('Welcome to Privacy Vault'), findsOneWidget);
    expect(find.text('Quick Actions'), findsOneWidget);
  });

  testWidgets('receipt list renders four reusable sample cards', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_screenApp(const ReceiptListScreen()));

    expect(find.byType(ReceiptCard), findsNWidgets(4));
    expect(find.text('Mobile Phone'), findsOneWidget);
    expect(find.text('Wrist Watch'), findsOneWidget);
  });

  testWidgets('receipt form validates required fields', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_screenApp(const AddReceiptScreen()));

    await tester.tap(find.text('Save Receipt'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter product name'), findsOneWidget);
    expect(find.text('Please enter store name'), findsOneWidget);
    expect(find.text('Please select purchase date'), findsOneWidget);
    expect(
      find.text('Please enter a valid price greater than zero'),
      findsOneWidget,
    );
  });

  testWidgets('consent tracker screen renders sample records', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_screenApp(const ConsentTrackerScreen()));

    expect(find.text('Privacy Tracker'), findsOneWidget);
    expect(find.text('Shopping App'), findsOneWidget);
  });

  testWidgets('warranty screen renders product details', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_screenApp(const WarrantyDetailsScreen()));

    expect(find.text('Wireless Headphones'), findsOneWidget);
    expect(find.text('Warranty Expiry'), findsOneWidget);
  });
}
