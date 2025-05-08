import 'package:flutter/material.dart';
import 'EditVehicleForm.dart';

class ManageVehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7FA),
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Manage Vehicle', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.teal),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => EditVehicleForm()));
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
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage('assets/scooter.png'),
                  ),
                  SizedBox(width: 18),
                  Text('Yamaha YB 125Z', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                  leading: Icon(Icons.two_wheeler, color: Colors.teal),
                  title: Text('Vehicle Type'),
                  subtitle: Text('Bike'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.precision_manufacturing, color: Colors.blueGrey),
                  title: Text('Manufacturer'),
                  subtitle: Text('Yamaha'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.confirmation_number, color: Colors.deepPurple),
                  title: Text('Model'),
                  subtitle: Text('YB 125Z'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.orange),
                  title: Text('Year'),
                  subtitle: Text('2018'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.indigo),
                  title: Text('License Plate'),
                  subtitle: Text('AHF-062'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.color_lens, color: Colors.pink),
                  title: Text('Color'),
                  subtitle: Text('Red'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
