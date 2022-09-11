import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:manan_mobile/landing_page.dart';
import 'package:manan_mobile/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    Timer(Duration(milliseconds: 5000), () {
      Navigator.pushReplacementNamed(context, LandingPage.routeName);
      // Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: SizeConfig.width - 50,
          height: SizeConfig.height - 100,
          child: Lottie.asset(
            "assets/animations/splash_anim.json",
          ),
        ),
      ),
    );
  }
}
