import 'package:deliveryboyapp/features/vehicle/ManageVehicleScreen.dart';
import 'package:deliveryboyapp/features/vehicle/signature.dart';
import 'package:flutter/material.dart';

class UploadDocumentsScreen extends StatelessWidget {
  final List<String> files = [
    'image 001.jpg',
    'image 002.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/cloud_upload.jpeg', // Replace with your illustration asset
                height: 300,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Upload Documents',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Follow the instructions you have received in the email and upload it securely form here.',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.07),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton.icon(
                onPressed: () {
                  // Handle file picker
                },
                icon: Icon(Icons.upload_file, color: Colors.red),
                label: Text(
                  'Add a file',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 24),
            ...files.map((file) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.black54, size: 22),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      file,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Handle file delete
                    },
                  ),
                ],
              ),
            )),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignatureScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit for review',
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
