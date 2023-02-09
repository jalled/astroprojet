import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ExampleApp extends StatefulWidget {
  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  StreamController<int> controller = StreamController<int>();
  String _signe = '';
  late SharedPreferences sharedprefs;
  late Timer timer;
  late Random random;
  late String result;
  late double degree;
  late int key;
  late int time;
  final Map<int, String> items = {
    0: 'Gémeaux',
    30: 'Taureau',
    60: 'Bélier',
    90: 'Poissons',
    120: 'Verseau',
    150: 'Capricorne',
    180: 'Sagittaire',
    210: 'Scorpion',
    240: 'Balance',
    270: 'Vierge',
    300: 'Lion',
    330: 'Cancer'
  };

  String signe = "Scorpion";
  void initial() async {
    sharedprefs = await SharedPreferences.getInstance();
    setState(() {
      _signe = sharedprefs.getString('signe')!;
      for (var x in items.values) {
        if (x == _signe) {
          key = items.keys
              .firstWhere((k) => items[k] == _signe, orElse: () => -1);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initial();

    rotateWheel();
    random = Random();
    degree = 0;
  }

  void rotateWheel() {
    time = 5000;
    timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (time > 0) {
        setState(() {
          degree = random.nextInt(40).toDouble();
        });
        time = time - 100;
      } else {
        setState(() {
          degree = key.toDouble() - 60;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 400,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Visibility(
                    visible: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: 3.14 / 180 * degree,
                        child: Image.asset(
                          "assets/images/roue.png",
                          height: 340,
                          width: 340,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/effet.png",
                      height: 700,
                      width: 520,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
