import 'package:flutter/material.dart';

import 'receipt_model.dart';

class WarrantyDetailsScreen extends StatelessWidget {
  const WarrantyDetailsScreen({super.key, this.receipt});

  final ReceiptRecord? receipt;

  static const Color darkGreen = Color(0xFF263522);
  static const Color sageGreen = Color(0xFF89966C);
  static const Color lightGreen = Color(0xFFDFE5D4);

  @override
  Widget build(BuildContext context) {
    final selectedReceipt = receipt ??
        (ReceiptStore.records.isNotEmpty ? ReceiptStore.records.first : null) ??
        const ReceiptRecord(
          productName: 'Wireless Headphones',
          storeName: 'Tech Point',
          purchaseDate: '12 March 2026',
          price: 5000,
          warrantyExpiryDate: '12 March 2027',
          receiptNumber: 'REC-1001',
          notes: 'Keep the receipt for warranty claims.',
          icon: Icons.headphones,
        );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F4),
      appBar: AppBar(title: const Text('Warranty Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product Warranty',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'View your product purchase and warranty information.',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const SizedBox(height: 22),
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Icon(selectedReceipt.icon, size: 85, color: darkGreen),
              ),
            ),
            const SizedBox(height: 22),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedReceipt.productName,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                    const SizedBox(height: 20),
                    WarrantyInfoRow(
                      icon: Icons.store_outlined,
                      label: 'Store Name',
                      value: selectedReceipt.storeName,
                    ),
                    WarrantyInfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Purchase Date',
                      value: selectedReceipt.purchaseDate,
                    ),
                    WarrantyInfoRow(
                      icon: Icons.verified_outlined,
                      label: 'Warranty Expiry',
                      value: selectedReceipt.warrantyExpiryDate,
                    ),
                    WarrantyInfoRow(
                      icon: Icons.receipt_long_outlined,
                      label: 'Receipt Number',
                      value: selectedReceipt.receiptNumber,
                    ),
                    WarrantyInfoRow(
                      icon: Icons.notes_outlined,
                      label: 'Notes',
                      value: selectedReceipt.notes,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: darkGreen,
                    size: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Warranty reminder preview: '
                      'check the expiry date before it ends.',
                      style: TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarrantyInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WarrantyInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: WarrantyDetailsScreen.sageGreen, size: 23),
          const SizedBox(width: 12),
          SizedBox(
            width: 115,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: WarrantyDetailsScreen.darkGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
