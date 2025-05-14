import 'package:flutter/material.dart';
import '../../../delivery_management/ screens/EditProfileForm.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7FA),
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Settings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blueGrey),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileForm()));
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/dek.jpeg'),
                  ),
                  SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rahul Sharma', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('rahul@gmai.com', style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text('Phone Number'),
                  subtitle: Text('+91 321-412-0144'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.location_city, color: Colors.deepPurple),
                  title: Text('City'),
                  subtitle: Text('Brooklyn'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.orange),
                  title: Text('Change Password'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to change password screen
                  },
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.indigo),
                  title: Text('Notifications'),
                  trailing: Switch(value: true, onChanged: (v) {}),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.palette, color: Colors.pink),
                  title: Text('Theme'),
                  trailing: DropdownButton<String>(
                    value: 'Light',
                    items: ['Light', 'Dark'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
