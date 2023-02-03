import 'dart:async';

import 'package:flutter/material.dart';
import 'package:astro2/splashScreen/ui/splash_Screen_Second.dart';

import 'deplayed_animation.dart';

//import 'SplashScreen2.dart';

class SplashScreenFirst extends StatefulWidget {
  const SplashScreenFirst({super.key});

  @override
  _SplashScreenFirstState createState() => _SplashScreenFirstState();
}

class _SplashScreenFirstState extends State<SplashScreenFirst> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const SplashScreenSecond())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashone.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  bottom: 350,
                  right: 10,
                  left: 10,
                  child: DelayedAnimation(
                    delay: 1000,
                    child: Image.asset(
                      "assets/images/LayerOne.png",
                    ), //fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
