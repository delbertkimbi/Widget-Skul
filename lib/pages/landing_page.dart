import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/pages/code_page.dart';
import 'package:widgets_app/pages/profile_page.dart';
import 'package:widgets_app/pages/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final screens = [HomePage(), CodePage(), ProfilePage()];
  int index = 0;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade500,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: navigationKey,
              backgroundColor: Colors.white,
              color: Colors.deepPurple.shade500,
              onTap: (currenpage) {
                setState(() => index = currenpage);
              },
              items: [
                Icon(Icons.home, size: 30, color: Colors.white),
                Icon(Icons.code, size: 30, color: Colors.white),
                Icon(Icons.person, size: 30, color: Colors.white),
              ],
            ),
            body: screens[index],
          ),
        ),
      ),
    );
  }
}
