// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class MyWebView extends StatefulWidget {
//   final String url;
//   final String token;
//
//   MyWebView({required this.url, required this.token});
//
//   @override
//   _MyWebViewState createState() => _MyWebViewState();
// }
//
// class _MyWebViewState extends State<MyWebView> {
//   late WebViewController _webViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('WebView Example'),
//       ),
//       body: WebView(
//         initialUrl: widget.url,
//         javascriptMode: JavascriptMode.unrestricted,
//         onWebViewCreated: (WebViewController webViewController) {
//           _webViewController = webViewController;
//           _loadUrlWithToken();
//         },
//       ),
//     );
//   }
//
//   void _loadUrlWithToken() async {
//     final tokenScript = 'localStorage.setItem("token", "${widget.token}");';
//     await _webViewController.evaluateJavascript(tokenScript);
//     _webViewController.reload();
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter WebView Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyWebView(
//         url: 'https://example.com',
//         token: 'your_token_here',
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
