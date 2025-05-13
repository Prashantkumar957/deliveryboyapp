import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  File? _profileImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pureBlack = Colors.black;
    final pureWhite = Colors.white;
    final cardBg = pureWhite;
    final bgColor = Colors.grey[50];
    final greyText = Colors.grey[700];

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: pureWhite)),
        backgroundColor: pureBlack,
        iconTheme: IconThemeData(color: pureWhite),
        elevation: 2,
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: cardBg,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : AssetImage('assets/dek.jpeg') as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: InkWell(
                            onTap: _pickImage,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: pureBlack,
                              child: Icon(Icons.camera_alt, color: pureWhite, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28),
                  TextFormField(
                    initialValue: name,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.person, color: pureBlack),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: pureBlack),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter your name' : null,
                    onSaved: (value) => name = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.phone, color: pureBlack),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: pureBlack),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value == null || value.isEmpty ? 'Enter phone number' : null,
                    onSaved: (value) => phone = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.email, color: pureBlack),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: pureBlack),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value == null || value.isEmpty ? 'Enter email' : null,
                    onSaved: (value) => email = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: city,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.location_city, color: pureBlack),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: pureBlack),
                      ),
                    ),
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
                      backgroundColor: pureBlack,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Save', style: TextStyle(fontSize: 16, color: pureWhite)),
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
