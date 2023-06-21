// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class WebViewPage extends StatefulWidget {
//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }
//
// class _WebViewPageState extends State<WebViewPage> {
//   late WebViewController _webViewController;
//   late String _url;
//   var key = r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';
//
//   @override
//   void initState() {
//     super.initState();
//     _getUrlWithTokenFromSharedPrefs();
//   }
//
//   Future<void> _getUrlWithTokenFromSharedPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString('token') ?? '';
//
//     setState(() {
//       // Concatenate the token with the base URL
//       _url = 'https://ct.versaflow.io/processes?api_token=$token&key=$key';
//     });
//   }
//
//   // @override
//   // void dispose() {
//   //   _webViewController.clear();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WebView with Token'),
//       ),
//       body: WebView(
//         initialUrl: _url,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController controller) {
//           _webViewController = controller;
//         },
//       ),
//     );
//   }
// }
