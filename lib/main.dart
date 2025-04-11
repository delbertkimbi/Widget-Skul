import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Skul',

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: false,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: SplashPage(),
    );
  }
}
