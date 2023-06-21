import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import '../../../core/database/db.provider.dart';
import '../../styles/colors.dart';
import '../../widgets/logout.widget.dart';

class WebViewScreenSAW extends StatefulWidget {
  final String appTitle;
  final String url;
  WebViewScreenSAW({required this.appTitle, required this.url});

  @override
  State<WebViewScreenSAW> createState() => _WebViewScreenSAWState();
}

class _WebViewScreenSAWState extends State<WebViewScreenSAW> {
  final _key = UniqueKey();
  bool _isLoading = true;
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    // Timer.periodic(
    //     const Duration(seconds: 5), (Timer t) => fetchStatus());
    // fetchStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: sawBackground,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   leading: IconButton(
        //     icon: const Icon(Icons.logout, color: Colors.white),
        //     onPressed: () {
        //       ///logout
        //       logout(context);
        //     },
        //   ),
        //   title: Text(
        //     widget.appTitle,
        //     style: const TextStyle(color: Colors.black),
        //   ),
        // ),
        body: Stack(
      children: [
        if (_isLoading) ...[
          Center(
              child: LoadingAnimationWidget.threeArchedCircle(
            color: primary,
            size: 100,
          )),
        ] else ...[
          WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.url,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
          ),
        ],
      ],
    ));
  }

  @override
  void dispose() {
    _webViewController.clearCache(); // Detach the WebView from the window.

    super.dispose();
  }
}
