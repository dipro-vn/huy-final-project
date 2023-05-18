import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/core/app_image.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/Splash';

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/Welcome'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppImages.splash),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
