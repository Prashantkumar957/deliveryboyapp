import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'DeliveryBoyListScreen.dart';

class DeliveryBoyFormScreen extends StatefulWidget {
  @override
  _DeliveryBoyFormScreenState createState() => _DeliveryBoyFormScreenState();
}

class _DeliveryBoyFormScreenState extends State<DeliveryBoyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String mobile = '';
  String location = '';
  String commissionType = 'Flat';
  String commission = '';
  File? _imageFile;

  final List<String> commissionTypes = ['Flat', 'Percentage'];

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
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
        title: Text('Add Delivery Boy', style: TextStyle(color: pureWhite)),
        backgroundColor: pureBlack,
        elevation: 2,
      ),
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Card(
              color: cardBg,
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Centered image upload
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 48,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: _imageFile != null
                                  ? FileImage(_imageFile!)
                                  : AssetImage('assets/profile_placeholder.png') as ImageProvider,
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
                      SizedBox(height: 18),
                      Text(
                        'Delivery Boy Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: pureBlack,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 28),

                      // Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.person, color: pureBlack),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: pureBlack, width: 2),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Please enter name' : null,
                        onChanged: (value) => name = value,
                      ),
                      SizedBox(height: 18),

                      // Mobile Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.phone, color: pureBlack),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: pureBlack, width: 2),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter mobile number' : null,
                        onChanged: (value) => mobile = value,
                      ),
                      SizedBox(height: 18),

                      // Location Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.location_on, color: pureBlack),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: pureBlack, width: 2),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Please enter location' : null,
                        onChanged: (value) => location = value,
                      ),
                      SizedBox(height: 18),

                      // Commission Type Dropdown
                      DropdownButtonFormField<String>(
                        value: commissionType,
                        decoration: InputDecoration(
                          labelText: 'Commission Type',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.monetization_on, color: pureBlack),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: pureBlack, width: 2),
                          ),
                        ),
                        items: commissionTypes.map((type) =>
                            DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            )
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            commissionType = value!;
                          });
                        },
                      ),
                      SizedBox(height: 18),

                      // Commission Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: commissionType == 'Flat' ? 'Commission Amount' : 'Commission Percentage',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.attach_money, color: pureBlack),
                          suffixText: commissionType == 'Percentage' ? '%' : '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: pureBlack, width: 2),
                          ),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        validator: (value) => value == null || value.isEmpty ? 'Please enter commission value' : null,
                        onChanged: (value) => commission = value,
                      ),
                      SizedBox(height: 32),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.save, color: pureWhite),
                          label: Text('Save', style: TextStyle(fontSize: 16, color: pureWhite, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final deliveryBoy = {
                                'name': name,
                                'mobile': mobile,
                                'location': location,
                                'commissionType': commissionType,
                                'commission': commission,
                                'image': _imageFile?.path,
                              };

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DeliveryBoyListScreen(newDeliveryBoy: deliveryBoy),
                                  )
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: pureBlack,
                            padding: EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                            elevation: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
