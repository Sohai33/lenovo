import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UBERUNS extends StatefulWidget {
  @override
  _UBERUNSState createState() => _UBERUNSState();
}
@override
class _UBERUNSState extends State<UBERUNS> {
  late WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: 'https://larustica.pizza/virtueller-rundgang/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
    );
  }
}