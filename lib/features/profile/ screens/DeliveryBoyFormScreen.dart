import 'package:flutter/material.dart';
import 'DeliveryBoyListScreen.dart';

class DeliveryBoyFormScreen extends StatefulWidget {
  @override
  _DeliveryBoyFormScreenState createState() => _DeliveryBoyFormScreenState();
}

class _DeliveryBoyFormScreenState extends State<DeliveryBoyFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String name = '';
  String mobile = '';
  String location = '';
  String commissionType = 'Flat';
  String commission = '';

  // List of commission types for dropdown
  final List<String> commissionTypes = ['Flat', 'Percentage'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryBlue = theme.primaryColor;
    final cardBg = Colors.white;
    final bgColor = Colors.grey[50];
    final greyText = Colors.grey[700];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Delivery Boy', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card header with icon
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryBlue.withOpacity(0.1),
                            child: Icon(Icons.delivery_dining, color: primaryBlue),
                          ),
                          SizedBox(width: 14),
                          Text(
                            'Delivery Boy Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),

                      // Name Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: greyText, fontWeight: FontWeight.w600),
                          prefixIcon: Icon(Icons.person, color: primaryBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
                          ),
                          fillColor: Colors.blue[50],
                          filled: false,
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
                          prefixIcon: Icon(Icons.phone, color: primaryBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
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
                          prefixIcon: Icon(Icons.location_on, color: primaryBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
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
                          prefixIcon: Icon(Icons.monetization_on, color: primaryBlue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
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
                          prefixIcon: Icon(Icons.attach_money, color: primaryBlue),
                          suffixText: commissionType == 'Percentage' ? '%' : '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: primaryBlue, width: 2),
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
                          icon: Icon(Icons.save, color: Colors.white),
                          label: Text('Save', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final deliveryBoy = {
                                'name': name,
                                'mobile': mobile,
                                'location': location,
                                'commissionType': commissionType,
                                'commission': commission,
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
                            backgroundColor: primaryBlue,
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
