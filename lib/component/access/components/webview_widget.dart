import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ydteam/component/access/components/carousel_slider.dart';
import 'package:ydteam/component/access/components/webview_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  final String url;
  const WebViewWidget({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    super.initState();
    //enable virtual display
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
      ),
      body: SafeArea(child: WebView(initialUrl: widget.url)),
    );
  }
}
