import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intellisuite/ui/screens/webviews/approvals/approvals_screen.dart';
import 'package:intellisuite/ui/screens/webviews/home/home_screen.dart';
import 'package:intellisuite/ui/screens/webviews/processes/processes_screen.dart';
import 'package:intellisuite/ui/screens/webviews/projects/saw/projects_screen.dart';
import 'package:intellisuite/ui/styles/colors.dart';
import 'package:intellisuite/ui/widgets/bottombar_item.dart';
import 'package:intellisuite/ui/widgets/logout.widget.dart';

import '../core/database/db.provider.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "icon": IconlyBold.home,
      "active_icon": IconlyLight.home,
      "page": const ProcessesWebView(),
      "title": "Processes"
    },
    {
      "icon": IconlyBold.folder,
      "active_icon": IconlyLight.folder,
      "page": const HomeWebView(),
      "title": "Projects"
    },
    {
      "icon": IconlyBold.swap,
      "active_icon": IconlyLight.swap,
      "page": const ApprovalsWebView(),
      "title": "Approvals"
    },
    {
      "icon": IconlyBold.logout,
      "active_icon": IconlyLight.logout,
      "page": const LogOut(),
      "title": "Logout"
    },
  ];

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 12.0,
          backgroundColor: secondaryColor,
          title: const Text(
            'Logout',
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          content: const Text(
            'You are about to logout',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RootApp(),
                  )),
              child: const Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
            TextButton(
              onPressed: () => DatabaseProvider().logOut(context),
              child: const Text('Logout',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20)
          // ),
          boxShadow: [
            BoxShadow(
                color: Colors.black87.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"]
                        : barItems[index]["icon"],
                    "",
                    isActive: activeTab == index,
                    activeColor: Colors.white,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                        if (index == 3) {
                          _showDialog();
                        }
                      });
                    },
                  ))),
    );
  }
}
