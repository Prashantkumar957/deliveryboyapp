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
    return Scaffold(
      backgroundColor: Colors.grey[200], // Grey background
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Row(
              children: [
                _orderTab('New', true),
                SizedBox(width: 8),
                _orderTab('Processing', false),
                SizedBox(width: 8),
                _orderTab('Delivered', false),
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
                    color: Colors.white, // White card background
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Order # ${order['id']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              Spacer(),
                              Text(order['date'] ?? '', style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text('Delivery Location: ${order['deliveryLocation']}', style: TextStyle(color: Colors.grey)),
                          Text('Delivery time: ${order['deliveryTime']}', style: TextStyle(color: Colors.grey)),
                          Text('Pickup location: ${order['pickupLocation']}', style: TextStyle(color: Colors.grey)),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  child: Text('Accept', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  child: Text('Reject', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: Colors.black),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  child: Text('Details', style: TextStyle(color: Colors.black)),
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
                  backgroundColor: Colors.red,
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

  Widget _orderTab(String label, bool selected) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.red : Colors.grey[200],
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
}
