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

  // Filter variables
  String? locationFilter;
  String? commissionTypeFilter;

  // Search query
  String searchQuery = '';

  // List of unique locations for filter
  List<String> get locations => deliveryBoys.map((e) => e['location'] as String).toSet().toList();

  @override
  void initState() {
    super.initState();
    // Add new delivery boy if provided
    if (widget.newDeliveryBoy != null) {
      deliveryBoys.add(widget.newDeliveryBoy!);
    }
  }

  // Filter delivery boys based on current filters
  List<Map<String, dynamic>> get filteredDeliveryBoys {
    return deliveryBoys.where((boy) {
      // Apply location filter
      if (locationFilter != null && boy['location'] != locationFilter) {
        return false;
      }

      // Apply commission type filter
      if (commissionTypeFilter != null && boy['commissionType'] != commissionTypeFilter) {
        return false;
      }

      // Apply search filter
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
    final theme = Theme.of(context);
    final primaryBlue = theme.primaryColor;
    final cardBg = Colors.white;
    final bgColor = Colors.grey[50];

    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Boys', style: TextStyle(color: Colors.white)),
        backgroundColor: primaryBlue,
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
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or mobile',
                prefixIcon: Icon(Icons.search, color: primaryBlue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryBlue),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // Filter section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text('Filter by: ', style: TextStyle(color: Colors.grey[700])),
                SizedBox(width: 8),

                // Location filter
                Expanded(
                  child: DropdownButton<String?>(
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
                SizedBox(width: 16),

                // Commission type filter
                Expanded(
                  child: DropdownButton<String?>(
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
                ? Center(child: Text('No delivery boys found'))
                : ListView.builder(
              itemCount: filteredDeliveryBoys.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final boy = filteredDeliveryBoys[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryBlue.withOpacity(0.1),
                              child: Text(
                                boy['name'].substring(0, 1),
                                style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    boy['name'],
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  Text(
                                    boy['mobile'],
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: boy['commissionType'] == 'Flat'
                                    ? Colors.blue[50]
                                    : Colors.green[50],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                boy['commissionType'] == 'Flat'
                                    ? '₹${boy['commission']}'
                                    : '${boy['commission']}%',
                                style: TextStyle(
                                  color: boy['commissionType'] == 'Flat'
                                      ? Colors.blue[700]
                                      : Colors.green[700],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                            SizedBox(width: 4),
                            Text(
                              boy['location'],
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.edit, size: 18),
                                label: Text('Edit'),
                                onPressed: () {
                                  // Navigate to edit screen (reuse form)
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: primaryBlue,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.delete, size: 18),
                                label: Text('Delete'),
                                onPressed: () {
                                  // Show delete confirmation
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: Text('Delete Delivery Boy'),
                                      content: Text('Are you sure you want to delete ${boy['name']}?'),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancel'),
                                          onPressed: () => Navigator.pop(ctx),
                                        ),
                                        TextButton(
                                          child: Text('Delete'),
                                          onPressed: () {
                                            setState(() {
                                              deliveryBoys.remove(boy);
                                            });
                                            Navigator.pop(ctx);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.red,
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
        backgroundColor: primaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DeliveryBoyFormScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
