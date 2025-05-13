import 'package:flutter/material.dart';
import 'dashboard/ screens/HomeScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // You can adjust these for shades if needed
  final Color pureBlack = Colors.black;
  final Color pureWhite = Colors.white;
  final Color darkGrey = Color(0xFF222222);
  final Color lightGrey = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black & White App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: pureBlack,
          onPrimary: pureWhite,
          secondary: darkGrey,
          onSecondary: pureWhite,
          background: pureWhite,
          onBackground: pureBlack,
          surface: lightGrey,
          onSurface: pureBlack,
          error: Colors.red,
          onError: pureWhite,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: pureBlack,
          foregroundColor: pureWhite,
          elevation: 2,
          iconTheme: IconThemeData(color: pureWhite),
          titleTextStyle: TextStyle(
            color: pureWhite,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: pureBlack,
          foregroundColor: pureWhite,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pureBlack,
            foregroundColor: pureWhite,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: pureBlack,
            side: BorderSide(color: pureBlack),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        cardColor: pureWhite,
        scaffoldBackgroundColor: pureWhite,
        textTheme: TextTheme(
          titleLarge: TextStyle(color: pureBlack, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.grey[700]),
        ),
        iconTheme: IconThemeData(color: pureBlack),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey[700]),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: pureBlack, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
