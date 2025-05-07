import 'package:deliveryboyapp/pages/MyOrdersScreen.dart';
import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Map and route illustration (use your own asset or widget)
          Stack(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                child: Image.asset(
                  'assets/map_bg.png', // Replace with your map asset
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: Icon(Icons.circle, color: Colors.red, size: 18),
              ),
              Positioned(
                top: 60,
                left: 70,
                child: Container(
                  width: 4,
                  height: 80,
                  color: Colors.red.withOpacity(0.3),
                ),
              ),
              Positioned(
                top: 140,
                left: 110,
                child: Icon(Icons.location_on, color: Colors.red, size: 48),
              ),
            ],
          ),
          // Card with driver and vehicle info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Driver row
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/dek.jpeg'), // Replace with your asset
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rahul  Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              Text('Your Deliver Boy,', style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 4),
                              Text('25 MINS AWAY', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Vehicle
                    Row(
                      children: [
                        Icon(Icons.directions_car, color: Colors.red),
                        SizedBox(width: 8),
                        Text('2009 BMW', style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(width: 16),
                        Text('525 TUY', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Delivery To
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Delivery To', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                '356 WestBroadway Road, Phenix, AZ, United States',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Order status steps
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                _orderStep('Order Delivered', 'your order has been delivered', true),
                _orderStep('On the way to dropoff location', 'Rider is going to dropoff location', true),
                _orderStep('Order Picked', 'Your order has been picked up', true),
                _orderStep('On the way to pickup location', 'Rider is going to pickup your order', true),
                _orderStep('Order Created', 'Your order has been placed', false),
              ],
            ),
          ),
          SizedBox(height: 24),
          // Bottom buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.chat, color: Colors.red),
                    label: Text('CHAT', style: TextStyle(color: Colors.red)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyOrdersScreen()));

                    },
                    icon: Icon(Icons.phone, color: Colors.white),
                    label: Text('TALK',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _orderStep(String title, String subtitle, bool completed) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              completed ? Icons.check_circle : Icons.radio_button_unchecked,
              color: completed ? Colors.red : Colors.grey[300],
              size: 24,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
          ],
        ),
        Divider(height: 24),
      ],
    );
  }
}
