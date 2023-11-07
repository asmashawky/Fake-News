import 'package:flutter/material.dart';
import 'package:untitled2/register.dart';
import 'package:untitled2/secnd.dart';
import 'package:untitled2/splash.dart';
import 'package:untitled2/start.dart';

import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.RouteName: (context) => LoginScreen(),
        RegisterL.RouteName: (context) => RegisterL(),
        secnd.RouteName: (context) => secnd(),
        start.RouteName: (context) => start(),
      },
      title: 'Splash Screen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
