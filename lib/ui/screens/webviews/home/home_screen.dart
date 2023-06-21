import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/webview/webview_saw.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../core/database/db.provider.dart';
import '../../../../core/service/routes_service.dart';

class HomeWebView extends StatefulWidget {
  const HomeWebView({Key? key}) : super(key: key);

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  late String newToken = '';
  late String key =
      r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';
  late String urlNew = '';
  late String wapToken = '';
  var projects;

  @override
  void initState() {
    projects = RoutesService().getProjects();
    DatabaseProvider().getToken().then((value) => {
          print('THIS IS $value'),
          setState(() {
            newToken = value;
            urlNew =
                'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=projects-tracking&api_token=$newToken&key=$key';
            print('THIS IS token wap $urlNew');
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
      wapToken = wap!;
    });

    // ....
  }

  // void asyncMethod() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final String? wap = prefs.getString('token');
  //   setState(() {
  //     wapToken = wap;
  //   });
  //
  //   // ....
  // }

  @override
  Widget build(BuildContext context) {
    return WebViewScreenSAW(
      appTitle: 'Projects',
      url:
          'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=projects&api_token=$wapToken&key=$key',
    );
  }
}

// https://www.smartclub.co.za/TestSmartClub/CompetitionExternal.do?token=$wapToken&action=SAW
