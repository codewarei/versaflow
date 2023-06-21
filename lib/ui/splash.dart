import 'package:flutter/material.dart';
import 'package:intellisuite/ui/root.dart';
import 'package:intellisuite/ui/screens/auth/loginWeb_screen.dart';
import 'package:intellisuite/ui/screens/auth/login_screen.dart';
import 'package:intellisuite/ui/styles/colors.dart';
import 'package:intellisuite/ui/utils/router.dart';
import 'package:intellisuite/ui/widgets/topimage.widget.dart';

import '../core/database/db.provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    navigate();
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  // void _setOnboardingCompleted() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('onboarding_completed', true);
  // }
  //
  //
  // void _checkOnboardingStatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
  //
  //   if (onboardingCompleted) {
  //     PageNavigator(ctx: context).nextPage(page: const LoginScreen());
  //     // navigate to login screen
  //   }
  // }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: const Center(
        child: SizedBox(
            height: 140,
            child: TopImage(imagePath: 'assets/images/versaflow-lite.png')),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () async {
      // PageNavigator(ctx: context).nextPage(page: const RootApp());
      DatabaseProvider().getToken().then((value) => {
            if (value == '')
              {PageNavigator(ctx: context).nextPage(page: const LoginScreen())}
            else
              {PageNavigator(ctx: context).nextPage(page: const LoginScreen())}
          });
      // PageNavigator(ctx: context).nextPage(page: const AuthCheck());
    });
  }
}
// assets/ui/SplashScreenIllustration.png
