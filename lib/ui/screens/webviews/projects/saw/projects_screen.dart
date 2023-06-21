import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/webview/webview_saw.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/database/db.provider.dart';

class ProjectWebView extends StatefulWidget {
  const ProjectWebView({Key? key}) : super(key: key);

  @override
  State<ProjectWebView> createState() => _ProjectWebViewState();
}

class _ProjectWebViewState extends State<ProjectWebView> {
  var newToken = '';
  var key = r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';
  var urlNew = '';
  var wapToken;
  var tok = r'$2y$10$0aDv6.P7FucN6mw8nbRRjO1dwCkd.yd7ZOlpR1WwMMsvnd2TeVY/S';

  @override
  void initState() {
    DatabaseProvider().getToken().then((value) => {
          setState(() {
            newToken = value;
            urlNew =
                'https://ct.versaflow.io/erp_api/getwebviewsession?api_token=$tok&key=$key';
            // print('THIS IS token wap $wapToken');
            //
          })
        });
    asyncMethod();
    super.initState();
  }

  void asyncMethod() async {
    final prefs = await SharedPreferences.getInstance();
    final String? wap = prefs.getString('token');
    setState(() {
      wapToken = wap;
    });

    // ....
  }

  @override
  Widget build(BuildContext context) {
    return WebViewScreenSAW(
      appTitle: 'Projects',
      url: urlNew,
    );
  }
}

// https://www.smartclub.co.za/TestSmartClub/CompetitionExternal.do?token=$wapToken&action=SAW
