import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_flutter_wallpaper/utils/routes/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToSignInPage() {
    Future.delayed(
      Duration(
        milliseconds: 2250,
      ),
      () => Navigator.popAndPushNamed(
        context,
        AppRoutes.adminHome,
      ),
    );
  }

  @override
  void initState() {
    navigateToSignInPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('SplashScreen');
    return Scaffold(
      body: Center(
        child: Text(
          "WallWonders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
