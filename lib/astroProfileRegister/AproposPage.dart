import 'dart:ui';

import 'package:flutter/material.dart';

import '../widget/back_button_widget.dart';

class APropos extends StatelessWidget {
  const APropos({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
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
                  'A propos',
                  style: TextStyle(
                      fontSize: 20 * ffem,
                      fontFamily: 'Larken Light',
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
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Image.asset("assets/images/menu-icon-ifB.png"))),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Container(
                    width: double.infinity,
                    height: 1658 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff44006b),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 1500 * fem,
                      child: Stack(children: [
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                25 * fem, 310 * fem, 51 * fem, 0 * fem),
                            width: 390 * fem,
                            height: 370 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20 * fem),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/images/bg.png',
                                ),
                              ),
                            ),
                            child: Text(
                              'Une voyance s??rieuse et de qualit??',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'Larken Bold',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 32 * fem,
                          top: 395 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 328 * fem,
                              height: 300 * fem,
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Larken-Light',
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2849999428 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          'Notre plateforme est le fruit de longues ann??es de travail et d???exp??rience en voyance, riches en ??motions et en rencontres. Nous visons depuis toujours ?? offrir les meilleurs services de voyance ?? nos clients et ce dans le but de satisfaire tous leurs besoins.\nNotre plateforme Aveniroscope d??barque sur la toile en rassemblant autour d???elle les ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10.5 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'meilleurs voyants',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        decoration: TextDecoration.underline,
                                        color: Color(0xffffffff),
                                        decorationColor: Color(0xffffffff),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' et astrologues originaires de diff??rents pays.\nEn acc??dant sur notre site, vous allez certainement faire la connaissance de m??diums, astrologues, num??rologues, tarologues et voyants ayant la capacit?? de changer votre vie pour le mieux !\n\nVous avez des doutes et vous n???arrivez pas ?? prendre les bonnes d??cisions ? Vous ne savez pas quoi faire ?\nAveniroscope met ?? votre disposition une ??quipe d???experts en voyance par t??l??phone qui vont vous accompagner et vous conseiller pendant tous vos moments difficiles. Ils vont entre autres vous orienter afin que vous puissiez prendre les bonnes d??cisions qui vont vous aider ?? mener une vie zen et remplie de petites douceurs tant sur le plan professionnel qu???amoureux.',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0 * fem,
                          top: 640 * fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                32 * fem, 36 * fem, 31 * fem, 103 * fem),
                            width: 390 * fem,
                            height: 879 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 15 * fem, 16 * fem, 21 * fem),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(13 * fem,
                                            0 * fem, 0 * fem, 10 * fem),
                                        child: Text(
                                          'Notre Mission',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Larken-Bold',
                                            fontSize: 20 * ffem,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w400,
                                            height: 1.2575 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 311 * fem,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontFamily: 'Larken-Light',
                                              fontSize: 10 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.2849999428 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Nous nous engageons ?? apporter et partager avec vous notre savoir-faire et notre expertise en voyance,',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' astrologie ',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffffffff),
                                                  decorationColor:
                                                      Color(0xffffffff),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'et horoscope... afin de vous accompagner ?? trouver le meilleur chemin pour am??liorer votre vie.',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 3 * fem, 17 * fem),
                                  child: Text(
                                    'Nos Valeurs',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Larken-Bold',
                                      fontSize: 20 * ffem,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2575 * ffem / fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 17 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 9 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff8c49a3),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                        width: double.infinity,
                                        height: 28 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0x26ffffff),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight: Radius.circular(10 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'RESPECT',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16 * ffem,
                                              decoration: TextDecoration.none,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 1 * fem, 0 * fem),
                                        constraints: BoxConstraints(
                                          maxWidth: 298 * fem,
                                        ),
                                        child: Text(
                                          'Nous agissons envers chaque client avec ??quit??, courtoisie et g??n??rosit??.',
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Poppins',
                                            fontSize: 10 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 17 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 7 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff8c49a3),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                        width: double.infinity,
                                        height: 28 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0x26ffffff),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight: Radius.circular(10 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'CONFIDENTIALIT??',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Poppins',
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 11 * fem, 0 * fem),
                                        constraints: BoxConstraints(
                                          maxWidth: 288 * fem,
                                        ),
                                        child: Text(
                                          'Votre s??curit?? est notre mission. Nous tenons ?? prot??ger votre vie priv??e et garantir la confidentialit?? de toutes vos coordonn??es personnelles',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            decoration: TextDecoration.none,
                                            fontSize: 10 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 17 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 7 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff8c49a3),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                        width: double.infinity,
                                        height: 28 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0x26ffffff),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight: Radius.circular(10 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'IMPLICATION',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              decoration: TextDecoration.none,
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 14 * fem, 0 * fem),
                                        constraints: BoxConstraints(
                                          maxWidth: 285 * fem,
                                        ),
                                        child: Text(
                                          'Quel que soit le forfait choisi, nous nous engageons avec passion, enthousiasme et professionnalisme dans toutes les consultations clients et ce, afin de vous donner des r??ponses fiables et convaincantes ?? vos incertitudes incessantes.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10 * ffem,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 17 * fem),
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff8c49a3),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                        width: double.infinity,
                                        height: 28 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0x26ffffff),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight: Radius.circular(10 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'PERFORMANCE',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              decoration: TextDecoration.none,
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 14 * fem, 0 * fem),
                                        constraints: BoxConstraints(
                                          maxWidth: 285 * fem,
                                        ),
                                        child: Text(
                                          'Nous associons les meilleures technologies aux meilleurs voyants afin d???obtenir des r??sultats honorables.',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            decoration: TextDecoration.none,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff8c49a3),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 0 * fem, 6 * fem),
                                        width: double.infinity,
                                        height: 28 * fem,
                                        decoration: BoxDecoration(
                                          color: Color(0x26ffffff),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10 * fem),
                                            topRight: Radius.circular(10 * fem),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'SERVICE',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              decoration: TextDecoration.none,
                                              fontSize: 16 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0 * fem, 0 * fem, 5 * fem, 0 * fem),
                                        constraints: BoxConstraints(
                                          maxWidth: 294 * fem,
                                        ),
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 10 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Gr??ce ?? notre attitude positive et notre organisation, nous visons ?? anticiper et d??passer les attentes de nos clients pour leur apporter une r??elle valeur ajout??e. Pour plus de d??tails, visitez la page ',
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                  )),
                                              TextSpan(
                                                text: 'nos valeurs',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffffffff),
                                                  decorationColor:
                                                      Color(0xffffffff),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' .Veuillez consultez la page ',
                                              ),
                                              TextSpan(
                                                text: 't??moignages',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffffffff),
                                                  decorationColor:
                                                      Color(0xffffffff),
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'r??clamation .',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5 * ffem / fem,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Color(0xffffffff),
                                                  decorationColor:
                                                      Color(0xffffffff),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
