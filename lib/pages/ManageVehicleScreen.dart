import 'package:flutter/material.dart';

class ManageVehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Manage Vehicle',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: AssetImage('assets/scooter.png'), // Replace with your image asset
                ),
                SizedBox(width: 16),
                Text(
                  'Add Photo',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            _vehicleField('Vehicle Type', 'Bike'),
            _vehicleField('Manufacture', 'Yamaha'),
            _vehicleField('Model', 'YB 125Z'),
            _vehicleField('Year', '2018'),
            _vehicleField('License Plate', 'AHF-062'),
            _vehicleField('Color', 'Red'),
          ],
        ),
      ),
    );
  }

  Widget _vehicleField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.edit, size: 20, color: Colors.grey[700]),
        ],
      ),
    );
  }
}
