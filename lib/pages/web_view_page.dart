import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: WebViewWidget(
        controller: WebViewController()..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
