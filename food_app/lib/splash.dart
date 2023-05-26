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
    Timer(const Duration(seconds: 1),
        () => Navigator.pushNamed(context, '/Welcome'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFE724C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 93,
            height: 93,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                    image: AssetImage('assets/image/logo.png'))),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/Food.png',
                width: 100,
                height: 50,
              ),
              SizedBox(
                width: 7,
              ),
              Image.asset(
                'assets/image/Hub.png',
                width: 72,
                height: 60,
              )
            ],
          )
        ],
      ),
    );
  }
}
