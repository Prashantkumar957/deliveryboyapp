import 'package:flutter/material.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String name = 'Rahul Sharma';
  String phone = '+91 321-412-0144';
  String email = 'rahul@gmai.com';
  String city = 'Brooklyn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Color(0xFFF7F7FA),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    initialValue: name,
                    decoration: InputDecoration(labelText: 'Name', prefixIcon: Icon(Icons.person)),
                    validator: (value) => value == null || value.isEmpty ? 'Enter your name' : null,
                    onSaved: (value) => name = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: phone,
                    decoration: InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone)),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value == null || value.isEmpty ? 'Enter phone number' : null,
                    onSaved: (value) => phone = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value == null || value.isEmpty ? 'Enter email' : null,
                    onSaved: (value) => email = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: city,
                    decoration: InputDecoration(labelText: 'City', prefixIcon: Icon(Icons.location_city)),
                    validator: (value) => value == null || value.isEmpty ? 'Enter city' : null,
                    onSaved: (value) => city = value!,
                  ),
                  SizedBox(height: 28),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile updated!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Save', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
