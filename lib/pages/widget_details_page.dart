import 'dart:math';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/constants/app_colors.dart';
import 'package:widgets_app/model/flutter_widget_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetDetailsPage extends StatefulWidget {
  final FlutterWidgetModel widgetModel;
  const WidgetDetailsPage({super.key, required this.widgetModel});

  @override
  State<WidgetDetailsPage> createState() => _WidgetDetailsPageState();
}

class _WidgetDetailsPageState extends State<WidgetDetailsPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    setState(() {
      isPlaying = !isPlaying;
      // if (isPlaying) {
      //   _controller.play();
      // } else {
      //   _controller.stop();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.widgetModel;

    return Scaffold(
      appBar: AppBar(
        title: Text("${model.name} Widget"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: isPlaying ? Colors.orange : Colors.white,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
      body: Stack(
        children: [
          ConfettiWidget(
            emissionFrequency: 0.4,
            blastDirection: pi / 2,
            gravity: 0.3,
            confettiController: _controller,
            colors: [AppColors.primaryPurple, AppColors.primaryOrage],
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                AvatarGlow(
                  glowColor: AppColors.primaryPurple,

                  child: CircleAvatar(
                    radius: 40,
                    child: Hero(
                      tag: model.name,
                      child: Icon(model.icon, size: 40, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionCard(
                  title: 'Description',
                  content: model.description,
                  icon: Icons.description,
                  url: model.learnMoreUrl,
                ),
                _buildSectionCard(
                  title: 'When to Use ${model.name}',
                  content: model.usage,
                  icon: Icons.lightbulb_outline,
                ),

                /// Example Code Image
                const SizedBox(height: 16),

                _buildExampleTabBar(model),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Navigator.pop(context),
      //   tooltip: 'Back',
      //   child: const Icon(Icons.arrow_back),
      // ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required String content,
    required IconData icon,
    String? url,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: AppColors.primaryPurple),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),

                  if (url != null) ...[
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        final uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri, mode: LaunchMode.inAppWebView);
                        } else {
                          // An error occured
                        }
                      },
                      child: const Text(
                        'Learn more',
                        style: TextStyle(
                          color: AppColors.primaryPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                  // if (url != null) ...[
                  //   const SizedBox(height: 8),
                  //   GestureDetector(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => WebViewScreen(url: url),
                  //         ),
                  //       );
                  //     },
                  //     child: Text(
                  //       'Learn more',
                  //       style: TextStyle(
                  //         color: AppColors.primaryPurple,
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //   ),
                  // ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Create a TabBar and TabBarView for Example Code and Output
Widget _buildExampleTabBar(FlutterWidgetModel model) {
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
        TabBar(
          indicatorColor: AppColors.primaryPurple,
          labelColor: AppColors.primaryPurple,
          unselectedLabelColor: Colors.black54,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          isScrollable: true,
          tabs: const [
            Tab(text: 'Example Code'),
            Tab(text: 'Example Output'),
            Tab(text: 'Try It'),
          ],
        ),
        // Tab View
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 300,
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SelectableText(
                      model.exampleImage,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              // Example Output Tab (Image or Preview of Output)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      model.exampleImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  child: Center(
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
