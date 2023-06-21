import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/webview/webview_saw.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/database/db.provider.dart';
import '../../../../core/service/routes_service.dart';

class ProcessesWebView extends StatefulWidget {
  const ProcessesWebView({Key? key}) : super(key: key);

  @override
  State<ProcessesWebView> createState() => _ProcessesWebViewState();
}

class _ProcessesWebViewState extends State<ProcessesWebView> {
  late String newToken = '';
  late String key =
      r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';
  late String urlNew = '';
  late String wapToken = '';
  var adminFlow;

  @override
  void initState() {
    adminFlow = RoutesService().getAdminFlow();
    DatabaseProvider().getToken().then((value) => {
          setState(() {
            newToken = value;

            // print('THIS IS token wap $wapToken');
            print('THIS IS token wap $urlNew');
            //
          }),
          urlNew =
              'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=approvals&api_token=$newToken&key=$key'
        });
    // asyncMethod();
    super.initState();
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
    print('$adminFlow this is');
    return WebViewScreenSAW(
      appTitle: 'Processes',
      url:
          'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=tracking&api_token=$newToken&key=$key',
    );
  }
}

// https://www.smartclub.co.za/TestSmartClub/CompetitionExternal.do?token=$wapToken&action=SAW
