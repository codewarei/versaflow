import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/webview/webview_saw.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/database/db.provider.dart';
import '../../../../core/service/routes_service.dart';

class ApprovalsWebView extends StatefulWidget {
  const ApprovalsWebView({Key? key}) : super(key: key);

  @override
  State<ApprovalsWebView> createState() => _ApprovalsWebViewState();
}

class _ApprovalsWebViewState extends State<ApprovalsWebView> {
  var newToken = '';
  var key = r'$2y$10$rO4mTY12aZPeuV570behsOujwA/kHChV.46RLDBTmox1V3aNekc4O';
  var urlNew = '';
  var wapToken;
  var approve;
//jj
  @override
  void initState() {
    // if(){
    //
    // }else{
    //
    // }
    approve = RoutesService().getApprove();
    setState(() {
      // newToken = value;
      urlNew =
          'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=$approve&api_token=$wapToken&key=$key';
      // print('THIS IS token wap $wapToken');
      //
    });
    // DatabaseProvider().getToken().then((value) => {
    //       setState(() {
    //         newToken = value;
    //         urlNew =
    //             'https://ct.versaflow.io/approvals?api_token=$wapToken&key=$key';
    //         // print('THIS IS token wap $wapToken');
    //         //
    //       })
    //     });

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
      appTitle: 'Approvals',
      url:
          'https://ct.versaflow.io/erp_api/getwebviewsession?redirect_to=approvals&api_token=$wapToken&key=$key',
    );
  }
}

// https://www.smartclub.co.za/TestSmartClub/CompetitionExternal.do?token=$wapToken&action=SAW
