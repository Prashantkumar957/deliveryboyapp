import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile photo and name
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage('assets/dek.jpeg'), // Replace with your asset
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    Text('Rahul Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            // Phone Number
            Text('Phone Number', style: TextStyle(color: Colors.grey, fontSize: 14)),
            SizedBox(height: 2),
            Text('+91 321-412-0144', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 24),
            // Email
            Text('Email', style: TextStyle(color: Colors.grey, fontSize: 14)),
            SizedBox(height: 2),
            Text('rahul@gmai.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 24),
            // City with edit icon
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('City', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      SizedBox(height: 2),
                      Text('Brookyn', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20, color: Colors.grey[700]),
                  onPressed: () {
                    // Handle city edit
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
