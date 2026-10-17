import 'package:flutter/material.dart';

class ConsentTrackerScreen extends StatelessWidget {
  const ConsentTrackerScreen({super.key});

  static const Color darkGreen = Color(0xFF263522);
  static const Color sageGreen = Color(0xFF89966C);
  static const Color lightGreen = Color(0xFFDFE5D4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F4),
      appBar: AppBar(title: const Text('Personal Data Diary')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Tracker',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Keep a record of the services that have your personal data.',
              style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.5),
            ),
            const SizedBox(height: 22),

            // Privacy summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(Icons.shield_outlined, size: 45, color: darkGreen),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Privacy Records',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: darkGreen,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '4 sample records saved in this preview.',
                          style: TextStyle(color: darkGreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Services and Shared Information',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 10),

            const ConsentRecordCard(
              serviceName: 'Shopping App',
              dataShared: 'Name, email and delivery address',
              dateAdded: '10 October 2026',
              icon: Icons.shopping_bag_outlined,
            ),

            const ConsentRecordCard(
              serviceName: 'Social Network',
              dataShared: 'Email and profile information',
              dateAdded: '02 September 2026',
              icon: Icons.people_outline,
            ),

            const ConsentRecordCard(
              serviceName: 'Food Delivery App',
              dataShared: 'Name, phone and home address',
              dateAdded: '21 August 2026',
              icon: Icons.delivery_dining_outlined,
            ),

            const ConsentRecordCard(
              serviceName: 'Learning Website',
              dataShared: 'Email and learning preferences',
              dateAdded: '14 July 2026',
              icon: Icons.school_outlined,
            ),

            const SizedBox(height: 12),

            const Text(
              'Note: These are example records entered manually. '
              'The app does not automatically scan other applications.',
              style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsentRecordCard extends StatelessWidget {
  final String serviceName;
  final String dataShared;
  final String dateAdded;
  final IconData icon;

  const ConsentRecordCard({
    super.key,
    required this.serviceName,
    required this.dataShared,
    required this.dateAdded,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ConsentTrackerScreen.lightGreen,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                color: ConsentTrackerScreen.darkGreen,
                size: 27,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ConsentTrackerScreen.darkGreen,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Personal information shared:',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    dataShared,
                    style: const TextStyle(
                      color: ConsentTrackerScreen.darkGreen,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Date added: $dateAdded',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
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
