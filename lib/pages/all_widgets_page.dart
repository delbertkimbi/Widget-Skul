import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/widgets/advanced_page.dart';
import 'package:widgets_app/widgets/begginer_page.dart';
import 'package:widgets_app/widgets/intermediate_page.dart';

class AllWidgetsPage extends StatelessWidget {
  const AllWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.deepPurple,
                  size: 24,
                ),
              ),
            ),
          ),
          title: Hero(
            tag: 'header',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Widget',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Skul',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
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
