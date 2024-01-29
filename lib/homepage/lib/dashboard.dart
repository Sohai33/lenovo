

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  @override
  _WebViewAppState createState() => _WebViewAppState();
}
class _WebViewAppState extends State<WebViewApp> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://larustica.pizza/',
        javascriptMode: JavascriptMode.unrestricted,

        debuggingEnabled: true,
        onProgress: (int progress) {
          print("WebView is $progress% loaded");
        },
    onWebResourceError: (WebResourceError error) {
      print("Error: ${error.description}");
    },
        userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148',
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;

        },


      ),
    );
  }
  Future<void> _requestGalleryPermission() async {
    // Request permission to access the device's gallery
    PermissionStatus status = await Permission.photos.request();

    if (status.isGranted) {
      // Permission is granted, you can now access the gallery
      // Display images or navigate to a page where you display images
    } else {
      // Permission is denied
      // You may want to show a message to the user or handle it in some way
    }
  }
}
