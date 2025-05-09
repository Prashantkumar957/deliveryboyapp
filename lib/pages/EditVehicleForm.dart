import 'package:flutter/material.dart';

class EditVehicleForm extends StatefulWidget {
  @override
  _EditVehicleFormState createState() => _EditVehicleFormState();
}

class _EditVehicleFormState extends State<EditVehicleForm> {
  final _formKey = GlobalKey<FormState>();
  String? type = 'Bike';
  String customType = '';
  String manufacturer = 'Yamaha';
  String model = 'YB 125Z';
  String year = '2018';
  String license = 'AHF-062';
  String color = 'Red';

  final List<String> vehicleTypes = [
    'Bike',
    'Scooter',
    'Car',
    'Van',
    'Truck',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryBlue = theme.colorScheme.primary;
    final cardBg = theme.colorScheme.surface;
    final bgColor = theme.colorScheme.background;
    final greyText = Colors.grey[700];

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Vehicle', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
        iconTheme: IconThemeData(color: Colors.white),
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
                  DropdownButtonFormField<String>(
                    value: type,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Type',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.two_wheeler, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    icon: Icon(Icons.keyboard_arrow_down, color: primaryBlue),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                    items: vehicleTypes
                        .map((v) => DropdownMenuItem(
                      value: v,
                      child: Text(v),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        type = value;
                        if (value != 'Other') customType = '';
                      });
                    },
                    validator: (value) => value == null || value.isEmpty ? 'Select vehicle type' : null,
                  ),
                  if (type == 'Other') ...[
                    SizedBox(height: 16),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Vehicle Type',
                        labelStyle: TextStyle(color: greyText),
                        prefixIcon: Icon(Icons.directions_car, color: primaryBlue),
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
                          borderSide: BorderSide(color: primaryBlue),
                        ),
                      ),
                      validator: (value) {
                        if (type == 'Other' && (value == null || value.isEmpty)) {
                          return 'Please enter vehicle type';
                        }
                        return null;
                      },
                      onChanged: (value) => customType = value,
                    ),
                  ],
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: manufacturer,
                    decoration: InputDecoration(
                      labelText: 'Manufacturer',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.precision_manufacturing, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter manufacturer' : null,
                    onSaved: (value) => manufacturer = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: model,
                    decoration: InputDecoration(
                      labelText: 'Model',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.confirmation_number, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter model' : null,
                    onSaved: (value) => model = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: year,
                    decoration: InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.calendar_today, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty ? 'Enter year' : null,
                    onSaved: (value) => year = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: license,
                    decoration: InputDecoration(
                      labelText: 'License Plate',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.credit_card, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter license plate' : null,
                    onSaved: (value) => license = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: color,
                    decoration: InputDecoration(
                      labelText: 'Color',
                      labelStyle: TextStyle(color: greyText),
                      prefixIcon: Icon(Icons.color_lens, color: primaryBlue),
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
                        borderSide: BorderSide(color: primaryBlue),
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter color' : null,
                    onSaved: (value) => color = value!,
                  ),
                  SizedBox(height: 28),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String vehicleTypeToSave = type == 'Other' ? customType : type!;
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Vehicle details updated! ($vehicleTypeToSave)')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Save', style: TextStyle(fontSize: 16, color: Colors.white)),
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
