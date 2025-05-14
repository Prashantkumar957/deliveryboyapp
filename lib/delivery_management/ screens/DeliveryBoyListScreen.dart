import 'package:flutter/material.dart';
import 'DeliveryBoyFormScreen.dart';

class DeliveryBoyListScreen extends StatefulWidget {
  final Map<String, dynamic>? newDeliveryBoy;

  DeliveryBoyListScreen({this.newDeliveryBoy});

  @override
  _DeliveryBoyListScreenState createState() => _DeliveryBoyListScreenState();
}

class _DeliveryBoyListScreenState extends State<DeliveryBoyListScreen> {
  List<Map<String, dynamic>> deliveryBoys = [
    {
      'name': 'Harshit',
      'mobile': '+91 98765-43210',
      'location': 'New Delhi',
      'commissionType': 'Flat',
      'commission': '100',
      // 'image': 'assets/harshit.png', // Optional: add image path if available
    },
    {
      'name': 'Rahul',
      'mobile': '+91 87654-32109',
      'location': 'Mumbai',
      'commissionType': 'Percentage',
      'commission': '15',
    },
    {
      'name': 'Nipun',
      'mobile': '+91 76543-21098',
      'location': 'Bangalore',
      'commissionType': 'Flat',
      'commission': '150',
    },
  ];

  String? locationFilter;
  String? commissionTypeFilter;
  String searchQuery = '';

  List<String> get locations =>
      deliveryBoys.map((e) => e['location'] as String).toSet().toList();

  @override
  void initState() {
    super.initState();
    if (widget.newDeliveryBoy != null) {
      deliveryBoys.add(widget.newDeliveryBoy!);
    }
  }

  List<Map<String, dynamic>> get filteredDeliveryBoys {
    return deliveryBoys.where((boy) {
      if (locationFilter != null && boy['location'] != locationFilter) {
        return false;
      }
      if (commissionTypeFilter != null &&
          boy['commissionType'] != commissionTypeFilter) {
        return false;
      }
      if (searchQuery.isNotEmpty &&
          !boy['name'].toLowerCase().contains(searchQuery.toLowerCase()) &&
          !boy['mobile'].toLowerCase().contains(searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();
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
        title: Text('Delivery Boys', style: TextStyle(color: pureWhite)),
        backgroundColor: pureBlack,
        elevation: 2,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DeliveryBoyFormScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by name or mobile',
                  prefixIcon: Icon(Icons.search, color: pureBlack),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: pureWhite,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
          ),

          // Filter section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              children: [
                Text('Filter:', style: TextStyle(color: greyText, fontWeight: FontWeight.w600)),
                SizedBox(width: 8),
                // Location filter
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: pureWhite,
                      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                    hint: Text('Location'),
                    value: locationFilter,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String?>(
                        value: null,
                        child: Text('All Locations'),
                      ),
                      ...locations.map((location) => DropdownMenuItem<String?>(
                        value: location,
                        child: Text(location),
                      )).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        locationFilter = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 12),
                // Commission type filter
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: pureWhite,
                      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                    hint: Text('Commission'),
                    value: commissionTypeFilter,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem<String?>(
                        value: null,
                        child: Text('All Types'),
                      ),
                      DropdownMenuItem<String?>(
                        value: 'Flat',
                        child: Text('Flat'),
                      ),
                      DropdownMenuItem<String?>(
                        value: 'Percentage',
                        child: Text('Percentage'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        commissionTypeFilter = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Active filters
          if (locationFilter != null || commissionTypeFilter != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8,
                children: [
                  if (locationFilter != null)
                    Chip(
                      label: Text('Location: $locationFilter'),
                      deleteIcon: Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() {
                          locationFilter = null;
                        });
                      },
                    ),
                  if (commissionTypeFilter != null)
                    Chip(
                      label: Text('Type: $commissionTypeFilter'),
                      deleteIcon: Icon(Icons.close, size: 18),
                      onDeleted: () {
                        setState(() {
                          commissionTypeFilter = null;
                        });
                      },
                    ),
                ],
              ),
            ),

          // Delivery boys list
          Expanded(
            child: filteredDeliveryBoys.isEmpty
                ? Center(child: Text('No delivery boys found', style: TextStyle(color: greyText)))
                : ListView.builder(
              itemCount: filteredDeliveryBoys.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final boy = filteredDeliveryBoys[index];
                return Card(
                  color: cardBg,
                  elevation: 3,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (boy['image'] != null && boy['image'].toString().isNotEmpty)
                              CircleAvatar(
                                backgroundImage: AssetImage(boy['image']),
                                radius: 22,
                              )
                            else
                              CircleAvatar(
                                backgroundColor: pureBlack.withOpacity(0.08),
                                radius: 22,
                                child: Text(
                                  boy['name'].substring(0, 1),
                                  style: TextStyle(color: pureBlack, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    boy['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: pureBlack),
                                  ),
                                  Text(
                                    boy['mobile'],
                                    style: TextStyle(color: greyText),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: boy['commissionType'] == 'Flat'
                                    ? Colors.grey[200]
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                boy['commissionType'] == 'Flat'
                                    ? '₹${boy['commission']}'
                                    : '${boy['commission']}%',
                                style: TextStyle(
                                  color: pureBlack,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: greyText),
                            SizedBox(width: 4),
                            Text(
                              boy['location'],
                              style: TextStyle(color: greyText),
                            ),
                          ],
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.edit, size: 18, color: pureBlack),
                                label: Text('Edit', style: TextStyle(color: pureBlack)),
                                onPressed: () {
                                  // Implement edit navigation
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: pureBlack,
                                  side: BorderSide(color: pureBlack),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.delete, size: 18, color: Colors.red[700]),
                                label: Text('Delete', style: TextStyle(color: Colors.red[700])),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => Dialog(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.warning_amber_rounded, color: Colors.red[700], size: 48),
                                            SizedBox(height: 16),
                                            Text(
                                              'Are you sure?',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'Do you really want to delete ${boy['name']}?',
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 28),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: OutlinedButton(
                                                    onPressed: () => Navigator.pop(ctx),
                                                    style: OutlinedButton.styleFrom(
                                                      foregroundColor: Colors.black,
                                                      side: BorderSide(color: Colors.black),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                      padding: EdgeInsets.symmetric(vertical: 12),
                                                    ),
                                                    child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold)),
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        deliveryBoys.remove(boy);
                                                      });
                                                      Navigator.pop(ctx);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.black,
                                                      foregroundColor: Colors.white,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                      padding: EdgeInsets.symmetric(vertical: 12),
                                                    ),
                                                    child: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red[700],
                                  side: BorderSide(color: Colors.red[700]!),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: pureBlack,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeliveryBoyFormScreen()),
          );
        },
        child: Icon(Icons.add, color: pureWhite),
      ),
    );
  }
}
