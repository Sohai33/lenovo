import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class event extends StatefulWidget {
  @override
  _eventState createState() => _eventState();
}
@override
class _eventState extends State<event> {
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: 'https://larustica.pizza/speisekarte/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}