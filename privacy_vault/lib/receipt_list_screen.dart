import 'package:flutter/material.dart';

import 'receipt_model.dart';
import 'warranty_details_screen.dart';

class ReceiptListScreen extends StatelessWidget {
  const ReceiptListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Receipts'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'My Purchase Records',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF35265E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${ReceiptStore.records.length} sample receipts',
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 20),
          for (final receipt in ReceiptStore.records)
            ReceiptCard(receipt: receipt),
        ],
      ),
    );
  }
}

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({super.key, required this.receipt});

  final ReceiptRecord receipt;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WarrantyDetailsScreen(receipt: receipt),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(receipt.icon, size: 38, color: const Color(0xFF6750A4)),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receipt.productName,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(receipt.storeName),
                    Text(
                      receipt.purchaseDate,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Rs. ${_formatPrice(receipt.price)}',
                      style: const TextStyle(
                        color: Color(0xFF6750A4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(double price) {
    final value = price.toStringAsFixed(2);
    return value.endsWith('.00') ? value.substring(0, value.length - 3) : value;
  }
}
