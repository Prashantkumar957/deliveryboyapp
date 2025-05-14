import 'package:deliveryboyapp/delivery_management/%20screens/DeliveryBoyFormScreen.dart';
import 'package:deliveryboyapp/delivery_management/%20screens/DeliveryBoyListScreen.dart';
import 'package:deliveryboyapp/marketplace/%20screens/MarketplaceScreen.dart';
import 'package:deliveryboyapp/pages/ChatScreen.dart';
import 'package:deliveryboyapp/dashboard/%20screens/DashboardScreen.dart';
import 'package:deliveryboyapp/delivery_management/%20screens/EditProfileForm.dart';
import 'package:deliveryboyapp/features/vehicle/EditVehicleForm.dart';
import 'package:deliveryboyapp/features/profile/%20screens/OnboardingPager.dart';
import 'package:flutter/material.dart';
import '../../features/auth/ForgotPasswordScreen.dart';
import '../../pages/History.dart';
import '../../features/auth/LoginScreen.dart';
import '../../features/vehicle/ManageVehicleScreen.dart';
import '../../features/orders/MyOrdersScreen.dart';
import '../../features/orders/OrderDetailScreen.dart';
import '../../features/orders/OrderTrackingScreen.dart';
import '../../features/profile/ screens/Setting.dart';
import '../../features/vehicle/signature.dart';
import '../../features/profile/ screens/Upload Documents Screen.dart';

class HomeScreen extends StatelessWidget {
  void _goTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentBlue = colorScheme.secondary;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: colorScheme.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, accentBlue],
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
              color: colorScheme.primary,
              onTap: () {
                Navigator.pop(context);
                _goTo(context, MyOrdersScreen());
              },
            ),
            _drawerItem(
              icon: Icons.person,
              text: 'Profile',
              color: accentBlue,
              onTap: () {
                Navigator.pop(context);
                _goTo(context, SettingsScreen());
              },
            ),
            _drawerItem(
              icon: Icons.logout,
              text: 'Logout',
              color: Colors.redAccent,
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
                style: TextStyle(color: Colors.grey[500], fontSize: 13),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: accentBlue),
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
                color: colorScheme.primary,
                letterSpacing: 1.1,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.12,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _homeButton(context, Icons.delivery_dining, 'DeliveryBoy Form ', MarketplaceScreen(), Colors.purple, colorScheme.surface),
                  _homeButton(context, Icons.people, 'All Delivery Boy', DeliveryBoyListScreen(), Colors.purple, colorScheme.surface),

                  _homeButton(context, Icons.dashboard, 'Dashboard', DashboardScreen(), Colors.blue, colorScheme.surface),

                  _homeButton(context, Icons.chat, 'Chat', ChatScreen(), Colors.purple, colorScheme.surface),
                  _homeButton(context, Icons.tour, 'Onboarding', OnboardingPager(), Colors.indigo, colorScheme.surface),
                  _homeButton(context, Icons.edit, 'Edit Profile', EditProfileForm(), Colors.blue, colorScheme.surface),
                  _homeButton(context, Icons.two_wheeler, 'Edit Vehicle', EditVehicleForm(), Colors.teal, colorScheme.surface),
                  _homeButton(context, Icons.receipt_long, 'Order Detail', OrderDetailScreen(), colorScheme.primary, colorScheme.surface),
                  _homeButton(context, Icons.login, 'Login', LoginScreen(), accentBlue, colorScheme.surface),
                  _homeButton(context, Icons.history, 'History', HistoryScreen(), Colors.indigo, colorScheme.surface),
                  _homeButton(context, Icons.lock_reset, 'Forgot Password', ForgotPasswordScreen(), Colors.orange[700]!, colorScheme.surface),
                  _homeButton(context, Icons.settings, 'Settings', SettingsScreen(), Colors.blueGrey, colorScheme.surface),
                  _homeButton(context, Icons.directions_bike, 'Manage Vehicle', ManageVehicleScreen(), Colors.teal, colorScheme.surface),
                  _homeButton(context, Icons.upload_file, 'Upload Documents', UploadDocumentsScreen(), Colors.purple, colorScheme.surface),
                  _homeButton(context, Icons.track_changes, 'Order Tracking', OrderTrackingScreen(), Colors.lightBlue, colorScheme.surface),
                  _homeButton(context, Icons.list_alt, 'My Orders', MyOrdersScreen(), Colors.green, colorScheme.surface),
                  _homeButton(context, Icons.edit, 'Signature', SignatureScreen(), Colors.deepPurple, colorScheme.surface),
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
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
      minLeadingWidth: 32,
    );
  }

  Widget _homeButton(BuildContext context, IconData icon, String label, Widget screen, Color iconColor, Color bgColor) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _goTo(context, screen),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.16),
                radius: 28,
                child: Icon(icon, size: 32, color: iconColor),
              ),
              SizedBox(height: 14),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
