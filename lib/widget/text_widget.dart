import 'package:flutter/material.dart';

Widget CustomText(String title, double size, double height) {
  return Text(
    title,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: "Larken Light",
        fontSize: size,
        fontWeight: FontWeight.w400,
        height: height,
        color: Colors.white),
  );
}
