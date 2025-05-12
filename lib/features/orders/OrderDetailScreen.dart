import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final Color backgroundColor = Colors.white;
  final Color primaryBlue = Color(0xFF1976D2); // A deep blue
  final Color lightBlue = Color(0xFFE3F2FD);

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.black;
    Color subTextColor = Colors.grey[700]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: BackButton(color: primaryBlue),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Order Details', style: TextStyle(color: primaryBlue)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: primaryBlue),
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
          _contactRow(Icons.phone, '+91 98765-43210', subTextColor),
          _contactRow(Icons.email, 'amit.sharma@email.com', subTextColor),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _circleIconButton(Icons.call, primaryBlue, () {}),
              SizedBox(width: 12),
              _circleIconButton(Icons.message, primaryBlue, () {}),
              SizedBox(width: 12),
              _circleIconButton(Icons.camera_alt, primaryBlue, () {}),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
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
                    backgroundColor: primaryBlue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Reject', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 28),
          _sectionTitle('Pickup Information', primaryBlue),
          _infoRow(
            title: 'Big Bazaar, Sector 18',
            phone: '+91 98989-87654',
            email: 'bigbazaar18@store.in',
            address: 'Plot No. 5, Sector 18, Noida, Uttar Pradesh, India',
            onMapTap: () {},
            textColor: subTextColor,
          ),
          Divider(height: 32, color: Colors.grey.shade300),
          _sectionTitle('Delivery Information', primaryBlue),
          _infoRow(
            title: 'Ravi Kumar',
            phone: '+91 91234-56789',
            email: 'ravi.kumar@email.com',
            address: 'Flat 201, Tower 3, Gaur City, Greater Noida, India',
            onMapTap: () {},
            textColor: subTextColor,
          ),
          Divider(height: 32, color: Colors.grey.shade300),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.navigation, color: Colors.white),
              label: Text('Start Navigating'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(height: 24),
          _sectionTitle('Items', primaryBlue),
          SizedBox(height: 12),
          _itemTile('assets/rice.jpg', 'India Gate Basmati Rice', '1kg', 2, subTextColor),
          SizedBox(height: 8),
          _itemTile('assets/mango.png', 'Mango', '100g', 1, subTextColor),
          SizedBox(height: 24),
          _sectionTitle('Note', primaryBlue),
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
              Text('₹3,250.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: primaryBlue)),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _contactRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 8),
          Text(text, style: TextStyle(color: color, fontSize: 15)),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, Color color) {
    return Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16));
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
              child: Text('Map it', style: TextStyle(color: Colors.blue)),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(imagePath, width: 48, height: 48, fit: BoxFit.cover),
        ),
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
