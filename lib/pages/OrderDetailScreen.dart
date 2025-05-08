import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final Color backgroundColor = Colors.white; // Change this to test dark backgrounds

  @override
  Widget build(BuildContext context) {
    bool isDarkBackground = backgroundColor.computeLuminance() < 0.5;
    Color textColor = isDarkBackground ? Colors.white : Colors.black;
    Color subTextColor = isDarkBackground ? Colors.white70 : Colors.grey[700]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: textColor),
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage('assets/dek.jpeg'),
              ),
              SizedBox(width: 16),
              Text(
                'Rahul Sharma',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
              ),
            ],
          ),
          SizedBox(height: 18),
          Row(
            children: [
              Icon(Icons.phone, color: subTextColor, size: 20),
              SizedBox(width: 8),
              Text('+91 98765-43210', style: TextStyle(color: subTextColor, fontSize: 15)),
            ],
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Icon(Icons.email, color: subTextColor, size: 20),
              SizedBox(width: 8),
              Text('amit.sharma@email.com', style: TextStyle(color: subTextColor, fontSize: 15)),
            ],
          ),
          SizedBox(height: 16),
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
                  child: Text('Accept',style: TextStyle(color: Colors.white),),
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
                  child: Text('Reject',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          Text('Pickup Information', style: TextStyle(color: subTextColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          _infoRow(
            title: 'Big Bazaar, Sector 18',
            phone: '+91 98989-87654',
            email: 'bigbazaar18@store.in',
            address: 'Plot No. 5, Sector 18, Noida, Uttar Pradesh, India',
            onMapTap: () {},
            textColor: subTextColor,
          ),
          Divider(height: 32, color: subTextColor),
          Text('Delivery Information', style: TextStyle(color: subTextColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          _infoRow(
            title: 'Ravi Kumar',
            phone: '+91 91234-56789',
            email: 'ravi.kumar@email.com',
            address: 'Flat 201, Tower 3, Gaur City, Greater Noida, India',
            onMapTap: () {},
            textColor: subTextColor,
          ),
          Divider(height: 32, color: subTextColor),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('Start Navigating',style: TextStyle(color: Colors.white),),
            ),
          ),
          SizedBox(height: 24),
          Text('Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
          SizedBox(height: 12),
          _itemTile('assets/rice.jpg', 'India Gate Basmati Rice', '1kg', 2, subTextColor),
          SizedBox(height: 8),
          _itemTile('assets/mango.png', 'Mango', '100g', 1, subTextColor),
          SizedBox(height: 24),
          Text('Note', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
          SizedBox(height: 6),
          Text(
            'Please deliver between 4PM-6PM and call before arriving.',
            style: TextStyle(color: subTextColor),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Job Total', style: TextStyle(color: subTextColor, fontSize: 15)),
              Text('₹3,250.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: textColor)),
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
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: textColor)),
        Text(phone, style: TextStyle(color: textColor)),
        Text(email, style: TextStyle(color: textColor)),
        Row(
          children: [
            Expanded(
              child: Text(address, style: TextStyle(color: textColor)),
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

  Widget _itemTile(String imagePath, String name, String size, int quantity, Color textColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 48, height: 48, fit: BoxFit.cover),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              Text('Size: $size', style: TextStyle(color: textColor, fontSize: 13)),
              Text('Quantity: $quantity', style: TextStyle(color: textColor, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
