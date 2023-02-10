import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro2/astroProfileRegister/registerStepOne.dart';

import '../../astroLogin/loginAstro.dart';

class SplashScreenSecond extends StatefulWidget {
  const SplashScreenSecond({super.key});

  @override
  _SplashScreenSecondState createState() => _SplashScreenSecondState();
}

class _SplashScreenSecondState extends State<SplashScreenSecond> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //   Duration(seconds: 3),
    // () => Navigator.pushReplacement(context,
    //   MaterialPageRoute(builder: (context) => RegisterStepOne())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splashone.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 100,
            height: 60,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Text(
                    "",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 10,
                  left: 10,
                  child: Image.asset(
                    "assets/images/LayerOne.png",
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  left: 10,
                  child: Image.asset(
                    "assets/images/Layer.png",
                  ),
                ),
                SizedBox(
                  width: 269,
                  height: 42,
                  child: Positioned(
                    top: 300,
                    right: 10,
                    left: 10,
                    child: Text(
                      'Les étoiles vous guident, découvrez ce \n         que votre signe vous cache',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 460.0), //The distance you want
                  child: ElevatedButton(
                    child: Text(
                      'Commencer',
                      style: TextStyle(
                        fontFamily: 'Larken Bold',
                        color: Color.fromARGB(255, 68, 0, 107),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileRegister()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 255, 255, 1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  