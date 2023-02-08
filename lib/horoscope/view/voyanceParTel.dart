import 'package:flutter/material.dart';

import '../../widget/back_button_widget.dart';
import '../../widget/circle_widget.dart';
import '../../widget/text_widget.dart';
import '../../widget/triangle_clipper_class.dart';

class VoyanceTelScreen extends StatelessWidget {
  const VoyanceTelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    var widthScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        fit: StackFit.expand,
        children: [
          Scaffold(
            extendBodyBehindAppBar: true,
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    boxShadow: [new BoxShadow(color: Colors.white)],
                    borderRadius: new BorderRadius.vertical(
                        bottom: new Radius.circular(26.0)),
                    gradient: LinearGradient(
                      begin: Alignment(-0, -0.691),
                      end: Alignment(0.003, 1.776),
                      colors: <Color>[Color(0xff44006b), Color(0x0044006b)],
                      stops: <double>[0.964, 0.981],
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  'Voyance par téléphone',
                  style: TextStyle(
                      fontSize: 16 * ffem,
                      fontFamily: 'Larken-Light',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.53),
                ),
                leading: InkWell(
                    onTap: () {}, child: backButton(context, Colors.white)),
                actions: [
                  InkWell(
                      onTap: () {},
                      child: IconButton(
                          onPressed: () {},
                          icon:
                              Image.asset("assets/images/menu-icon-ifB.png"))),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: 1221 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xff44006b),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      child: Container(
                        width: 913 * fem,
                        height: 304.17 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Container(
                                width: 390 * fem,
                                height: 304.17 * fem,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Color(0xff44006b).withOpacity(0.65),
                                          BlendMode.darken),
                                      image: AssetImage(
                                          "assets/images/voyance-par-tel.png"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 56 * fem,
                              top: 100 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 293 * fem,
                                  height: 63 * fem,
                                  child: Text(
                                    "Voyance Authentique, immédiate et réelle",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Larken-Light",
                                        fontSize: 24 * ffem,
                                        height: 1.2575 * ffem / fem,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10 * fem,
                              top: 190 * fem,
                              child: Container(
                                height: 30,
                                width: widthScreen * 0.94,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10 * fem,
                                      right: 220 * fem,
                                      top: 1 * fem,
                                      bottom: 2 * fem,
                                      child: SizedBox(
                                        width: 200,
                                        child: Center(
                                          child: Text(
                                            "04 28 63 97 81",
                                            style: TextStyle(
                                                fontFamily: 'Larken Light',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 19 * fem),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5 * fem,
                                      child: Container(
                                        height: 40,
                                        width: widthScreen * 0.4,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff8c49a3)),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: -20,
                                              top: 6,
                                              child: RotationTransition(
                                                turns:
                                                    const AlwaysStoppedAnimation(
                                                        110 / 100),
                                                child: ClipPath(
                                                  clipper: TriangleClipper(),
                                                  child: Container(
                                                    color: Colors.white,
                                                    height: 33,
                                                    width: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 42 * fem,
                                              top: 1 * fem,
                                              left: 7 * fem,
                                              bottom: 10 * fem,
                                              child: Center(
                                                child: Text(
                                                  "Service 0,80€ /min \n +Prix d'appel",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10 * fem),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 76 * fem,
                        top: 340 * fem,
                        child: Container(
                          width: 238 * fem,
                          height: 1200 * fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 238 * fem,
                                ),
                                child: CustomText(
                                    "Voyance par téléphone Comment ça marche?",
                                    22 * ffem,
                                    1.2575 * ffem / fem),
                              ),
                              SizedBox(height: 18),
                              CircleWidget("searchhh", 1.5, "1"),
                              SizedBox(height: 10),
                              CustomText("Je consulte les profils des experts ",
                                  16 * fem, 1.2575 * ffem / fem),
                              SizedBox(height: 18),
                              CircleWidget("handdd", 1.5, "2"),
                              SizedBox(height: 10),
                              CustomText("Je choisis un voyant", 16 * fem,
                                  1.2575 * ffem / fem),
                              SizedBox(height: 18),
                              CircleWidget("tell", 1.5, "3"),
                              SizedBox(height: 10),
                              CustomText(
                                  "J'appelle", 16 * fem, 1.2575 * ffem / fem)
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
