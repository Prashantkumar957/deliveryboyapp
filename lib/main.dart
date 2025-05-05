import 'package:deliveryboyapp/pages/ManageVehicleScreen.dart';
import 'package:deliveryboyapp/pages/Upload%20Documents%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:deliveryboyapp/pages/signature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Boy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UploadDocumentsScreen(), // <-- Widget here
    );
  }
}
