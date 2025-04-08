import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/pages/code_page.dart';
import 'package:widgets_app/pages/home_page.dart';
import 'package:widgets_app/pages/profile_page.dart';
import 'package:widgets_app/pages/search_page.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  final screens = [HomePage(), WidgetSearchPage(), CodePage(), ProfilePage()];
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
                Icon(Icons.search, size: 30, color: Colors.white),
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
