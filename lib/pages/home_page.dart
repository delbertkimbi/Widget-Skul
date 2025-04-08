import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/pages/advanced_page.dart';
import 'package:widgets_app/pages/begginer_page.dart';
import 'package:widgets_app/pages/intermediate_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Widget',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Skul',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicator: ShapeDecoration(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.deepPurple,
            padding: EdgeInsets.all(8),
            tabs: [
              Tab(text: 'Basic'),
              Tab(text: 'Intermediate'),
              Tab(text: 'Advanced'),
            ],
          ),
        ),
        body: LiquidPullToRefresh(
          color: AppColors.primaryPurple,
          height: 300,
          showChildOpacityTransition: false,
          onRefresh: () {
            return Future.delayed(Duration(seconds: 3), () {});
          },
          child: TabBarView(
            children: [
              Center(child: BegginerPage()),
              Center(child: IntermediatePage()),
              Center(child: AdvancedPage()),
            ],
          ),
        ),
      ),
    );
  }
}
