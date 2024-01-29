import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class contact extends StatefulWidget {
  @override
  _contactState createState() => _contactState();
}
@override
class _contactState extends State<contact> {
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: 'https://larustica.pizza/contact/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}