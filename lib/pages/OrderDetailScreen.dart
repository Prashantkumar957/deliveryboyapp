import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Profile Row
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your asset
              ),
              SizedBox(width: 16),
              Text(
                'Sarah Joseph',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          SizedBox(height: 18),
          // Contact Info
          Row(
            children: [
              Icon(Icons.phone, color: Colors.black54, size: 20),
              SizedBox(width: 8),
              Text(
                '+91 321-212-0544',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.email, color: Colors.black54, size: 20),
              SizedBox(width: 8),
              Text(
                'prashant.phillips@gmail.com',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Contact Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _circleIconButton(Icons.call, Colors.red, () {}),
              SizedBox(width: 12),
              _circleIconButton(Icons.message, Colors.red, () {}),
              SizedBox(width: 12),
              _circleIconButton(Icons.camera_alt, Colors.red, () {}),
            ],
          ),
          SizedBox(height: 16),
          // Accept/Reject Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Accept'),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Reject'),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          // Pickup Information
          Text('Pickup Information', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          _infoRow(
            title: 'Target Store',
            phone: '+91 347-272-0544',
            email: 'prashant@gmail.com',
            address: '150 Broadway, New York, NY 10038, United States',
            onMapTap: () {},
          ),
          Divider(height: 32),
          // Delivery Information
          Text('Delivery Information', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          _infoRow(
            title: 'Prashant Joseph',
            phone: '+91 321-212-0544',
            email: 'sarah@gmail.com',
            address: '277 Canal St, New York, NY 10013, United States',
            onMapTap: () {},
          ),
          Divider(height: 32),
          // Start Navigating Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Start Navigating'),
            ),
          ),
          SizedBox(height: 24),
          // Items
          Text('Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 12),
          _itemTile('assets/pineapple.png', 'The Swan Vietnam Jasmine Rice', '18gx4', 1),
          SizedBox(height: 8),
          _itemTile('assets/strawberry.png', 'The Swan Vietnam Jasmine Rice', 'Black+M', 1),
          SizedBox(height: 24),
          // Note
          Text('Note', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 6),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ...more',
            style: TextStyle(color: Colors.black87),
          ),
          SizedBox(height: 24),
          // Job Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Job Total', style: TextStyle(color: Colors.grey[700], fontSize: 15)),
              Text('\$1,765.50', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _circleIconButton(IconData icon, Color color, VoidCallback onTap) {
    return Ink(
      decoration: ShapeDecoration(
        color: color.withOpacity(0.1),
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onTap,
      ),
    );
  }

  Widget _infoRow({
    required String title,
    required String phone,
    required String email,
    required String address,
    required VoidCallback onMapTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(phone, style: TextStyle(color: Colors.grey[700])),
        Text(email, style: TextStyle(color: Colors.grey[700])),
        Row(
          children: [
            Expanded(
              child: Text(address, style: TextStyle(color: Colors.grey[700])),
            ),
            TextButton(
              onPressed: onMapTap,
              child: Text('Map it', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _itemTile(String imagePath, String name, String size, int quantity) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 48, height: 48, fit: BoxFit.cover),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Size: $size', style: TextStyle(color: Colors.grey[700], fontSize: 13)),
              Text('Quantity: $quantity', style: TextStyle(color: Colors.grey[700], fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
