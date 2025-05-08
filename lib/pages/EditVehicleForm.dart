import 'package:flutter/material.dart';

class EditVehicleForm extends StatefulWidget {
  @override
  _EditVehicleFormState createState() => _EditVehicleFormState();
}

class _EditVehicleFormState extends State<EditVehicleForm> {
  final _formKey = GlobalKey<FormState>();
  String type = 'Bike';
  String manufacturer = 'Yamaha';
  String model = 'YB 125Z';
  String year = '2018';
  String license = 'AHF-062';
  String color = 'Red';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryBlue = theme.colorScheme.primary;
    final accentBlue = theme.colorScheme.secondary;
    final cardBg = theme.colorScheme.surface;
    final bgColor = theme.colorScheme.background;

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
                  TextFormField(
                    initialValue: type,
                    decoration: InputDecoration(
                      labelText: 'Vehicle Type',
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
                    validator: (value) => value == null || value.isEmpty ? 'Enter vehicle type' : null,
                    onSaved: (value) => type = value!,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    initialValue: manufacturer,
                    decoration: InputDecoration(
                      labelText: 'Manufacturer',
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
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Vehicle details updated!')),
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
