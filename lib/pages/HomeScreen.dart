import 'package:flutter/material.dart';
import 'ForgotPasswordScreen.dart';
import 'History.dart';
import 'LoginScreen.dart';
import 'ManageVehicleScreen.dart';
import 'MyOrdersScreen.dart';
import 'OrderDetailScreen.dart';
import 'OrderTrackingScreen.dart';
import 'Setting.dart';
import 'signature.dart';
import 'Upload Documents Screen.dart';

class HomeScreen extends StatelessWidget {
  void _goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = Color(0xFFCC313D); // Cherry red
    final Color accentTeal = Color(0xFFA7BEAE); // Muted teal
    final Color cardBg = Color(0xFFF7F7FA); // Light gray
    final Color drawerBg = Color(0xFFF3F4F6); // Off-white

    return Scaffold(
      drawer: Drawer(
        backgroundColor: drawerBg,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryRed, accentTeal],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundImage: AssetImage('assets/dek.jpeg'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rahul Sharma',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19)),
                      SizedBox(height: 4),
                      Text('rahul@example.com',
                          style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            _drawerItem(
              icon: Icons.assignment,
              text: 'Manage Orders',
              color: primaryRed,
              onTap: () {
                Navigator.pop(context);
                _goTo(context, MyOrdersScreen());
              },
            ),
            _drawerItem(
              icon: Icons.person,
              text: 'Profile',
              color: accentTeal,
              onTap: () {
                Navigator.pop(context);
                _goTo(context, SettingsScreen());
              },
            ),
            _drawerItem(
              icon: Icons.logout,
              text: 'Logout',
              color: Colors.grey[700]!,
              onTap: () {
                Navigator.pop(context);
                // Add logout logic here
              },
            ),
            SizedBox(height: 24),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 16),
              child: Text(
                'v3.39.0',
                style: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: cardBg,
        elevation: 1,
        iconTheme: IconThemeData(color: primaryRed),
        title: Text('Home',
            style: TextStyle(
                color: primaryRed, fontWeight: FontWeight.bold, fontSize: 22)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: accentTeal),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Screens',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: primaryRed),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _homeButton(context, Icons.receipt_long, 'Order Detail', OrderDetailScreen(), primaryRed, cardBg),
                  _homeButton(context, Icons.login, 'Login', LoginScreen(), accentTeal, cardBg),
                  _homeButton(context, Icons.history, 'History', HistoryScreen(), Colors.deepPurple, cardBg),
                  _homeButton(context, Icons.lock_reset, 'Forgot Password', ForgotPasswordScreen(), Colors.orange[700]!, cardBg),
                  _homeButton(context, Icons.settings, 'Settings', SettingsScreen(), Colors.blueGrey, cardBg),
                  _homeButton(context, Icons.directions_bike, 'Manage Vehicle', ManageVehicleScreen(), Colors.teal, cardBg),
                  _homeButton(context, Icons.upload_file, 'Upload Documents', UploadDocumentsScreen(), Colors.indigo, cardBg),
                  _homeButton(context, Icons.track_changes, 'Order Tracking', OrderTrackingScreen(), Colors.pink[700]!, cardBg),
                  _homeButton(context, Icons.list_alt, 'My Orders', MyOrdersScreen(), Colors.green[700]!, cardBg),
                  _homeButton(context, Icons.edit, 'Signature', SignatureScreen(), Colors.brown, cardBg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
      onTap: onTap,
      horizontalTitleGap: 0,
      minLeadingWidth: 32,
    );
  }

  Widget _homeButton(BuildContext context, IconData icon, String label, Widget screen, Color iconColor, Color bgColor) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _goTo(context, screen),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.12),
                radius: 28,
                child: Icon(icon, size: 32, color: iconColor),
              ),
              SizedBox(height: 14),
              Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
