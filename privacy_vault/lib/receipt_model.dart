import 'package:flutter/material.dart';

class ReceiptRecord {
  const ReceiptRecord({
    required this.productName,
    required this.storeName,
    required this.purchaseDate,
    required this.price,
    this.warrantyExpiryDate = '12 March 2027',
    this.receiptNumber = 'REC-1001',
    this.notes = 'Keep the receipt for warranty claims.',
    this.icon = Icons.headphones,
  });

  final String productName;
  final String storeName;
  final String purchaseDate;
  final double price;
  final String warrantyExpiryDate;
  final String receiptNumber;
  final String notes;
  final IconData icon;
}

class ReceiptStore {
  ReceiptStore._();

  static final List<ReceiptRecord> records = [
    const ReceiptRecord(
      productName: 'Mobile Phone',
      storeName: 'Samsung Store',
      purchaseDate: '10 October 2026',
      price: 45000,
      warrantyExpiryDate: '10 October 2028',
      receiptNumber: 'REC-1002',
      notes: 'Repair service coverage applies within 12 months.',
      icon: Icons.smartphone,
    ),
    const ReceiptRecord(
      productName: 'Headphones',
      storeName: 'Tech World',
      purchaseDate: '5 October 2026',
      price: 5000,
      warrantyExpiryDate: '5 October 2027',
      receiptNumber: 'REC-1003',
      notes: 'Battery warranty valid for one year from purchase date.',
      icon: Icons.headphones,
    ),
    const ReceiptRecord(
      productName: 'Laptop',
      storeName: 'Computer House',
      purchaseDate: '1 October 2026',
      price: 120000,
      warrantyExpiryDate: '1 October 2029',
      receiptNumber: 'REC-1004',
      notes: 'Keep this receipt for hardware service support.',
      icon: Icons.laptop_mac,
    ),
    const ReceiptRecord(
      productName: 'Wrist Watch',
      storeName: 'Time Zone',
      purchaseDate: '25 September 2026',
      price: 8000,
      warrantyExpiryDate: '25 September 2028',
      receiptNumber: 'REC-1005',
      notes: 'Water resistance service plan is included.',
      icon: Icons.watch,
    ),
  ];

  static void addReceipt(ReceiptRecord receipt) {
    records.insert(0, receipt);
  }
}
