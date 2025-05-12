import 'package:flutter/material.dart';
import '../../auth/LoginScreen.dart';
import '../../../dashboard/ screens/HomeScreen.dart';

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
      'image': 'assets/dob.png',
    },
    {
      'title': 'Secure Delivery',
      'description':
      'Your packages are delivered safely and securely, with real-time updates and proof of delivery.',
      'image': 'assets/doob.png',
    },
    {
      'title': 'Track in Real Time',
      'description':
      'Follow your order’s journey live on the map and communicate directly with your driver.',
      'image': 'assets/dobb.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = Color(0xFF1976D2);
    final Color accentBlue = Color(0xFF64B5F6);
    final Color bgColor = Colors.white;
    final Color textColor = Colors.black87;
    final Color buttonColor = primaryBlue;
    final Color indicatorActive = primaryBlue;
    final Color indicatorInactive = accentBlue.withOpacity(0.3);

    return Scaffold(
      backgroundColor: bgColor,
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
                        color: Colors.black.withOpacity(0.08),
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
                              color: accentBlue,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data['title'],
                            style: TextStyle(
                              color: primaryBlue,
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
                              color: textColor,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        data['image'],
                        height: 460,
                        fit: BoxFit.cover,
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
                  children: _buildPageIndicator(indicatorActive, indicatorInactive),
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
                      backgroundColor: buttonColor,
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
                      side: BorderSide(color: accentBlue, width: 1.5),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: accentBlue,
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

  Widget _indicator(bool isActive, Color activeColor, Color inactiveColor) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 28.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inactiveColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  List<Widget> _buildPageIndicator(Color activeColor, Color inactiveColor) {
    return List<Widget>.generate(
      onboardingData.length,
          (index) => _indicator(_currentPage == index, activeColor, inactiveColor),
    );
  }
}
