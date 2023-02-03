import 'dart:convert';

import 'package:astro2/astroProfileRegister/profileUser.dart';
import 'package:astro2/horoscope/model/HoroscopeHiverModel.dart';
import 'package:astro2/horoscope/model/HoscopeModel.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloC/glassphormismResources.dart';
import 'package:http/http.dart' as http;

import 'horoscopeHiver2023.dart';

class HomeHoroscope extends StatefulWidget {
  const HomeHoroscope({super.key});

  @override
  State<HomeHoroscope> createState() => _HomeHoroscopeState();
}

class _HomeHoroscopeState extends State<HomeHoroscope>
    with TickerProviderStateMixin {
  static List<Contents> list_horoscope = [];
  static List<Contents> list_horoscope_jour = [];

  final ScrollController _mycontroller = new ScrollController();

  @override
  void initState() {
    getHoroscopeDemain().then((value) {
      setState(() {
        list_horoscope = value;
      });
    });
    getHoroscopeJour().then((value) {
      setState(() {
        list_horoscope_jour = value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      appBar: AppBar(
          title: Text(
            "Horoscope",
            style: TextStyle(
              fontFamily: 'Larken Bold',
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w400,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/Flesh.svg',
              width: 10,
              height: 20,
              fit: BoxFit.scaleDown,
            ),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          actions: <Widget>[
            SvgPicture.asset(
              'assets/images/menuicon.svg',
              width: 30,
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
            ),
          ],
          elevation: 15.00,
          backgroundColor: const Color.fromARGB(255, 68, 0, 107)),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  controller: _mycontroller,
                  child: Column(
                    children: <Widget>[
                      BlocProfil(context),
                      BlocShadowSigne(context),
                      TabBarHoroscope(context),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget BlocProfil(context) {
    return Container(
      height: 60.0,
      width: 350.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Omran',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                '12 Sept 1998',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilUser(),
                  ),
                );
              },
              child: Text(
                "Mon Profile",
                style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 10,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31.0),
                ),
                side: const BorderSide(width: 2, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BlocShadowSigne
  Widget BlocShadowSigne(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          //  border: Border.all(color: Colors.blue, width: 2.0),
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        margin: const EdgeInsets.all(5.0),
        height: 64.0,
        width: 350.0,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.9, 0.1),
              child: SvgPicture.asset('assets/images/Layer1.svg',
                  width: 31, height: 31, fit: BoxFit.scaleDown),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/Layer 1.svg',
                  width: 50, height: 50, fit: BoxFit.scaleDown),
            ),
            Column(
              children: const [
                SizedBox(height: 10),
                Align(
                  alignment: const Alignment(-0.9, 0.1),
                  child: Text(
                    "Votre signe est",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: const Alignment(-0.9, 1.6),
                  child: Text('Vierge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget TabBarHoroscope(context) {
    double opacityLevel = 1.0;
    TabController _tabController = TabController(length: 3, vsync: this);

    return Container(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 40, right: 20),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/VIBI.png'),
                  ),
                ),
                indicatorWeight: 5.0,
                indicatorPadding:
                    EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 0),
                tabs: [
                  Tab(text: "Aujourd'hui"),
                  Tab(text: "Demain"),
                  Tab(text: "Hiver2023"),
                ],
              ),
            ),
          ),
          // Ligne de conduit icons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 1.0,
              width: 300.0,
              color: Colors.black,
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.only(right: 40),
              height: 500,
              child: TabBarView(
                controller: _tabController,
                children: [
                  //----------------------------ITEM1------------------------------------

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          list_horoscope.isNotEmpty
                                              ? list_horoscope[0]
                                                  .phrase
                                                  .toString()
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope.isNotEmpty
                                                        ? list_horoscope[0]
                                                            .love
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope.isNotEmpty
                                                        ? list_horoscope[0]
                                                            .argent
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope.isNotEmpty
                                                        ? list_horoscope[0]
                                                            .family
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                              //  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),
                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),
                                            const SizedBox(height: 12),
                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "C’est en lâchant prise que vous réussirez à vaincre vos peurs du lendemain. Votre entourage vous aidera dans ce sens !",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
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

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          list_horoscope_jour.isNotEmpty
                                              ? list_horoscope_jour[0]
                                                  .phrase
                                                  .toString()
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope_jour
                                                            .isNotEmpty
                                                        ? list_horoscope_jour[0]
                                                            .love
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope_jour
                                                            .isNotEmpty
                                                        ? list_horoscope_jour[0]
                                                            .argent
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    list_horoscope_jour
                                                            .isNotEmpty
                                                        ? list_horoscope_jour[0]
                                                            .family
                                                            .toString()
                                                        : '',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                    indicatorIconColor:
                                                        Colors.white,
                                                    indicatorIconSize: 27,
                                                  ),
                                                ),
                                              ),
                                              //  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),
                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),
                                            const SizedBox(height: 12),
                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card three
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        itemSize: 20,
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          list_horoscope_jour.isNotEmpty
                                              ? list_horoscope_jour[0]
                                                  .advice
                                                  .toString()
                                              : '',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
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

                  //---------------------------------ITEM 4 ---------------------------------
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HorscopeHiver()),
                                              );
                                              // handle push to HomeScreen
                                            },
                                            child: SizedBox(
                                              height: 40,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Horoscope Hiver 2023 ',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Amour, boulot, famille, travail, santé… dans notre rubrique Horoscope de l’hiver, vous trouverez tout ce que vous voulez savoir",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),

                                // 2eme container
                                const SizedBox(height: 40),

                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),
                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),
                                          ],
                                        ),
                                      ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Contents>> getHoroscopeDemain() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    //var signe = sharedPreferences.getString('signe');
    // print(signe);
    String signe = 'Cancer';
    String jour = "demain";
    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-content-horoscope-by-day-and-signe';

    return await http.post(Uri.parse(_myUrl),
        headers: <String, String>{},
        body: {"signe": signe, "jour": jour}).then((response) {
      print(response.body.toString());

      Horoscope horoscope = Horoscope.fromJson(json.decode(response.body));
      List<Contents> list_horoscope = [];
      for (int i = 0; i < horoscope.content!.length; i++) {
        list_horoscope.add(horoscope.content![i]);
        print('hahahahha');
        print(horoscope.content![i].argent);
      }
      String credits = list_horoscope[0].phrase as String;
      sharedPreferences.setString("credit", credits);

      return list_horoscope;
    });
  }

  Future<List<Contents>> getHoroscopeJour() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    //var signe = sharedPreferences.getString('signe');
    // print(signe);
    String signe = 'Cancer';
    String jour = "jour";
    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-content-horoscope-by-day-and-signe';

    return await http.post(Uri.parse(_myUrl),
        headers: <String, String>{},
        body: {"signe": signe, "jour": jour}).then((response) {
      print(response.body.toString());

      Horoscope horoscope = Horoscope.fromJson(json.decode(response.body));
      List<Contents> list_horoscope_jour = [];
      for (int i = 0; i < horoscope.content!.length; i++) {
        list_horoscope_jour.add(horoscope.content![i]);
        print('hahahahha');
        print(horoscope.content![i].argent);
      }
      String credits = list_horoscope_jour[0].phrase as String;
      sharedPreferences.setString("credit", credits);

      return list_horoscope_jour;
    });
  }
}
