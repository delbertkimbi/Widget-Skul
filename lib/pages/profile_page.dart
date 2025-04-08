import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ProfilePage',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
