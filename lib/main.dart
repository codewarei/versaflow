import 'package:flutter/material.dart';
import 'package:intellisuite/ui/screens/auth/loginWeb_screen.dart';
import 'package:intellisuite/ui/screens/st.dart';
import 'package:intellisuite/ui/splash.dart';
import 'package:provider/provider.dart';

import 'core/database/db.provider.dart';
import 'core/provider/auth.provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
          ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(),
          ),
          debugShowCheckedModeBanner: false,
          title: 'Intellisuite',
          home: const SplashScreen(),
        ));
  }
}
