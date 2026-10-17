import 'package:flutter/material.dart';

import 'receipt_model.dart';

class AddReceiptScreen extends StatelessWidget {
  const AddReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) => const _AddReceiptForm();
}

class _AddReceiptForm extends StatefulWidget {
  const _AddReceiptForm();

  @override
  State<_AddReceiptForm> createState() => _AddReceiptFormState();
}

class _AddReceiptFormState extends State<_AddReceiptForm> {
  final _formKey = GlobalKey<FormState>();
  final _productController = TextEditingController();
  final _storeController = TextEditingController();
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  DateTime? _purchaseDate;

  @override
  void dispose() {
    _productController.dispose();
    _storeController.dispose();
    _dateController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final today = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _purchaseDate ?? today,
      firstDate: DateTime(1900),
      lastDate: today,
    );

    if (selectedDate != null) {
      setState(() {
        _purchaseDate = selectedDate;
        _dateController.text = _formatDate(selectedDate);
      });
    }
  }

  void _saveReceipt() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.parse(_priceController.text.trim());
    final receipt = ReceiptRecord(
      productName: _productController.text.trim(),
      storeName: _storeController.text.trim(),
      purchaseDate: _dateController.text.trim(),
      price: price,
      warrantyExpiryDate: _calculateWarrantyDate(_purchaseDate ?? DateTime.now()),
      receiptNumber: 'REC-${DateTime.now().millisecondsSinceEpoch % 100000}',
      notes: 'Receipt added from the form and saved to the vault.',
      icon: _iconForProduct(_productController.text.trim()),
    );

    ReceiptStore.addReceipt(receipt);

    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receipt saved successfully.')),
    );
    Navigator.pop(context, true);
  }

  String _calculateWarrantyDate(DateTime date) {
    final expiryDate = DateTime(date.year + 1, date.month, date.day);
    return '${expiryDate.day} ${_monthName(expiryDate.month)} ${expiryDate.year}';
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  IconData _iconForProduct(String productName) {
    final name = productName.toLowerCase();
    if (name.contains('phone') || name.contains('mobile')) {
      return Icons.smartphone;
    }
    if (name.contains('laptop') || name.contains('computer')) {
      return Icons.laptop_mac;
    }
    if (name.contains('watch')) {
      return Icons.watch;
    }
    return Icons.receipt_long;
  }

  String _formatDate(DateTime date) {
    return '${date.day} ${_monthName(date.month)} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Receipt'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.receipt_long,
                  size: 80,
                  color: Color(0xFF6750A4),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Enter Receipt Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF35265E),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _productController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.shopping_bag),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter product name'
                    : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _storeController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Store Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.store),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please enter store name'
                    : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                onTap: _selectDate,
                decoration: const InputDecoration(
                  labelText: 'Purchase Date',
                  hintText: 'Select the purchase date',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Please select purchase date'
                    : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Price (Rs.)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.currency_exchange),
                ),
                validator: (value) {
                  final price = double.tryParse(value?.trim() ?? '');
                  if (price == null || !price.isFinite || price <= 0) {
                    return 'Please enter a valid price greater than zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6750A4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  icon: const Icon(Icons.save),
                  label: const Text('Save Receipt'),
                  onPressed: _saveReceipt,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
