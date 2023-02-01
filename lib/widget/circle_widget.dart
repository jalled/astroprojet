import 'package:flutter/material.dart';

Widget CircleWidget(String image, double size, String badge) {
  return Stack(
    children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${image}.png"),
                alignment: Alignment.center),
            shape: BoxShape.circle,
            color: Color(0xff8c49a3)),
      ),
      Positioned(
        left: 20,
        top: 3,
        child: Container(
          height: 30,
          width: 30,
          child: Center(
              child: Text(
            badge,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Larken-Bold',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xff44016b)),
          )),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff46056c), width: 2.0),
              shape: BoxShape.circle,
              color: Colors.white),
        ),
      ),
    ],
  );
}
