import 'package:flutter/material.dart';

import 'add_receipt_screen.dart';
import 'consent_tracker_screen.dart';
import 'receipt_list_screen.dart';
import 'receipt_model.dart';
import 'warranty_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color purple = Color(0xFF6750A4);
  static const Color darkText = Color(0xFF35265E);

  void _openScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Vault'),
        centerTitle: true,
        leading: const Icon(Icons.shield),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Welcome to Privacy Vault',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your receipts, warranties and personal data in one secure place.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/privacy.png',
                height: 260,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Text('Privacy image not found'),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.lock, size: 35, color: Colors.white),
                  const SizedBox(height: 12),
                  const Text(
                    'Your Personal Vault',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Keep your important purchase records organized and private.',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/images/receipt.png',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Text(
                        'Receipt image not found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Vault Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          const Icon(Icons.receipt_long, color: purple, size: 32),
                          const SizedBox(height: 10),
                          Text(
                            '${ReceiptStore.records.length}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Receipts'),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          const Icon(Icons.verified_user, color: purple, size: 32),
                          const SizedBox(height: 10),
                          Text(
                            '${ReceiptStore.records.length}',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Warranties'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                onTap: () => _openScreen(context, const ConsentTrackerScreen()),
                leading: Image.asset(
                  'assets/images/privacy.png',
                  width: 65,
                  height: 65,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.privacy_tip,
                    color: purple,
                    size: 38,
                  ),
                ),
                title: const Text('Privacy Records'),
                subtitle: const Text('5 saved consent records'),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _QuickActionTile(
              title: 'My Receipts',
              subtitle: 'Four example purchase records',
              icon: Icons.receipt_long,
              onTap: () => _openScreen(context, const ReceiptListScreen()),
            ),
            const SizedBox(height: 10),
            _QuickActionTile(
              title: 'Create New Receipt',
              subtitle: 'Enter details of a new purchase',
              icon: Icons.add_circle_outline,
              onTap: () => _openScreen(context, const AddReceiptScreen()),
            ),
            const SizedBox(height: 10),
            _QuickActionTile(
              title: 'Warranty Tracker',
              subtitle: 'View warranty expiry dates',
              icon: Icons.calendar_month,
              onTap: () => _openScreen(context, const WarrantyDetailsScreen()),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: HomeScreen.purple, size: 35),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
