import 'package:deliveryboyapp/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart'; // Adjust import as per your folder structure

class OnboardingPager extends StatefulWidget {
  @override
  _OnboardingPagerState createState() => _OnboardingPagerState();
}

class _OnboardingPagerState extends State<OnboardingPager> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      'title': 'Manage Orders',
      'description':
      'Easily manage all your orders, track their status, and stay organized from pickup to delivery.',
      'image': 'assets/images/onb_orders.png', // Use a relevant illustration
    },
    {
      'title': 'Secure Delivery',
      'description':
      'Your packages are delivered safely and securely, with real-time updates and proof of delivery.',
      'image': 'assets/images/onb_secure.png', // Use a relevant illustration
    },
    {
      'title': 'Track in Real Time',
      'description':
      'Follow your order’s journey live on the map and communicate directly with your driver.',
      'image': 'assets/images/onb_tracking.png', // Use a relevant illustration
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = Color(0xFFCC313D);
    final Color accentTeal = Color(0xFFA7BEAE);
    final Color cardBg = Color(0xFFF7F7FA);

    return Scaffold(
      backgroundColor: cardBg,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              final data = onboardingData[index];
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  margin: EdgeInsets.only(top: 60, bottom: 100),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome to QuickMove",
                            style: TextStyle(
                              color: accentTeal,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data['title'],
                            style: TextStyle(
                              color: primaryRed,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            data['description'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[800],
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        data['image'],
                        height: 260,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 32,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(primaryRed, accentTeal),
                ),
                SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_currentPage < onboardingData.length - 1) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryRed,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      _currentPage < onboardingData.length - 1
                          ? 'Continue'
                          : 'Get Started',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      side: BorderSide(color: accentTeal, width: 1.5),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: accentTeal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive, Color primaryRed, Color accentTeal) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 28.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? primaryRed : accentTeal.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  List<Widget> _buildPageIndicator(Color primaryRed, Color accentTeal) {
    return List<Widget>.generate(
      onboardingData.length,
          (index) => _indicator(_currentPage == index, primaryRed, accentTeal),
    );
  }
}
