import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'id': '1234',
      'date': '05-12-2019',
      'deliveryLocation': '277 Canal St, New York, NY',
      'deliveryTime': 'June 10, 10:00 am',
      'pickupLocation': '150 Broadway, New York, NY',
    },
    {
      'id': '1235',
      'date': '05-12-2019',
      'deliveryLocation': '123 Main St, New York, NY',
      'deliveryTime': 'June 11, 11:00 am',
      'pickupLocation': '200 Park Ave, New York, NY',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryBlue = theme.colorScheme.primary;
    final cardBg = theme.colorScheme.surface;
    final accentBlue = theme.colorScheme.secondary;
    final textColor = theme.colorScheme.onSurface;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              children: [
                _orderTab(context, 'New', true),
                SizedBox(width: 8),
                _orderTab(context, 'Processing', false),
                SizedBox(width: 8),
                _orderTab(context, 'Delivered', false),
              ],
            ),
            SizedBox(height: 16),
            // List of orders
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, idx) {
                  final order = orders[idx];
                  return Card(
                    color: cardBg,
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Order #${order['id']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: textColor)),
                              Spacer(),
                              Text(order['date'] ?? '',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 15)),
                            ],
                          ),
                          SizedBox(height: 8),
                          _orderDetailRow(
                              'Delivery Location:', order['deliveryLocation']!),
                          _orderDetailRow(
                              'Delivery time:', order['deliveryTime']!),
                          _orderDetailRow(
                              'Pickup location:', order['pickupLocation']!),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: Text('Accept',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: Text('Reject',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: primaryBlue),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: Text('Details',
                                      style: TextStyle(color: primaryBlue)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Floating chat button
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0, right: 8.0),
                child: FloatingActionButton(
                  backgroundColor: primaryBlue,
                  onPressed: () {},
                  child: Icon(Icons.chat, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderTab(BuildContext context, String label, bool selected) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: selected ? theme.colorScheme.primary : Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _orderDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
