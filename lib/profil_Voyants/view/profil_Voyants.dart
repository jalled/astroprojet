import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_horizontal_featured_list/flutter_horizontal_featured_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

//import '../../astro_Home/view/home.dart';

class ProfilVoyantsAndTchats extends StatefulWidget {
  const ProfilVoyantsAndTchats({super.key});

  @override
  State<ProfilVoyantsAndTchats> createState() => _ProfilVoyantsAndTchatsState();
}

class _ProfilVoyantsAndTchatsState extends State<ProfilVoyantsAndTchats>
    with TickerProviderStateMixin {
  int _index = 0;

  final ScrollController _mycontroller = new ScrollController();
  List<Color> colors = List.generate(20, (index) => rrandomColor());
  List<Color> colorsVoyant = List.generate(20, (index) => randomColorVoyant());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 0, 107),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 68, 0, 107),
                leading: SvgPicture.asset(
                  'assets/images/Flesh.svg',
                  width: 10,
                  height: 40,
                ),

                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Tchat & Voyance",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
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
                elevation: 10.0,
                // false par default
                automaticallyImplyLeading: true,
                expandedHeight: 50,
                floating: true,
                snap: true,
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: _mycontroller,
                    child: Column(
                      children: <Widget>[
                        Voyant(context),
                        VoyantSNote(context),
                        VoyantSNote2(context),
                        Ccm(context),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Voyant(context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Profils des voyants',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          HorizontalFeaturedList(
            itemHeight: 357,
            itemWidth: 350,
            itemColorBuilder: (context, index) => colorsVoyant[index],
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 0, left: 5),
                    child: Row(
                      children: [
                        Text(
                          'Linda',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset('assets/images/state.svg'),
                        SizedBox(
                          width: 160,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 0, right: 0, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset('assets/images/Achievement.svg'),
                              SvgPicture.asset('assets/images/Achievement.svg'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tarologue - Voyant',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Column(
                        children: [
                          RatingBar.builder(
                            updateOnDrag: true,
                            ignoreGestures: true,
                            initialRating: 1,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.yellow,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Consultations',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          // const SizedBox(height: 3),
                          Text(
                            '616',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 10, right: 0, left: 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 132.7,
                          height: 132,
                          child: Image.asset('assets/images/VIVI.png'),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 126,
                          height: 109,
                          child: Text(
                            "Bonjour, je suis Louise ! Medium pure, j'ai pour mission de vie de dévoiler votre avenir sentimentale, professionnel ou financier À tout voir plus",
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // -------------------------button here -------------------
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      width: 267,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(
                                text: '14€ les 10 mins \n',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '+ 3.70€ la minute supp.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: SizedBox(
                              width: 120,
                              height: 45,
                              child: TextButton(
                                child: Text(
                                  'Consulter',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color:
                                        const Color.fromARGB(255, 68, 0, 107),
                                    //backgroundColor: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            color: Colors.white)),
                                  ),
                                ),
                                onPressed: () {
                                  print('Pressed');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            onPressedItem: () {},
            onPressedSeeAll: () {}, seeAllText: '', titleText: '',
            // titleText: 'Top Voyants',
            // seeAllText: '',
          ),
        ],
      ),
    );
  }

//---------------------Voyant Super Note --------------------------------
  Widget VoyantSNote(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 0, right: 0, left: 0),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, right: 40, left: 0),
            child: Text(
              'Les Voyants les mieux notes ',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
          HorizontalFeaturedList(
            itemHeight: 250,
            itemWidth: 163,
            itemColorBuilder: (context, index) => colors[index],
            // itemCount: colors.length,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        'Linda',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/images/state.svg'),
                      const SizedBox(width: 55),
                      SvgPicture.asset('assets/images/like.svg'),
                    ],
                  ),
                  SizedBox(height: 2),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Tarologue - Voyant',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 13, 13, 13),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Image.asset(
                    'assets/images/VIVI.png',
                    width: 150,
                    height: 120,
                  ),
                  const SizedBox(height: 8),
                  RatingBar.builder(
                    updateOnDrag: true,
                    ignoreGestures: true,
                    initialRating: 1,
                    minRating: 1,
                    itemSize: 15,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    unratedColor: Colors.black38,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    width: 120,
                    height: 32,
                    child: TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 93, 189, 187)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Respond to button press
                      },
                      icon: Icon(Icons.chat, size: 18, color: Colors.white),
                      label: Text(
                        "TCHATEZ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            onPressedItem: () {},
            onPressedSeeAll: () {}, seeAllText: '', titleText: '',
            // titleText: 'Top Voyants',
            // seeAllText: '',
          ),
        ],
      ),
    );
  }

  Widget VoyantSNote2(context) {
    return Container(
      child: HorizontalFeaturedList(
        itemHeight: 250,
        itemWidth: 163,
        itemColorBuilder: (context, index) => colors[index],
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Linda',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 13, 13, 13),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset('assets/images/state.svg'),
                  const SizedBox(width: 55),
                  SvgPicture.asset('assets/images/like.svg'),
                ],
              ),
              SizedBox(height: 2),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Tarologue - Voyant',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(255, 13, 13, 13),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Image.asset(
                'assets/images/VIVI.png',
                width: 150,
                height: 120,
              ),
              SizedBox(height: 8),
              RatingBar.builder(
                updateOnDrag: true,
                ignoreGestures: true,
                initialRating: 1,
                minRating: 1,
                itemSize: 15,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                unratedColor: Colors.black38,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 2,
              ),
              SizedBox(
                width: 120,
                height: 32,
                child: TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 93, 189, 187)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Respond to button press
                  },
                  icon: Icon(Icons.chat, size: 18, color: Colors.white),
                  label: Text(
                    "TCHATEZ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onPressedItem: () {},
        onPressedSeeAll: () {}, seeAllText: '', titleText: '',
        // titleText: 'Top Voyants',
        // seeAllText: '',
      ),
    );
  }

  Widget Ccm(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
      child: Stack(
        children: [
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
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/Idee.svg',
                          color: Colors.white,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Container(
                        width: 341,
                        height: 100,
                        // width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),

                        child: Center(
                          child: Text(
                            'Comment ça marche ?',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Color rrandomColor() {
  var g = math.Random.secure().nextInt(255);
  var b = math.Random.secure().nextInt(255);
  var r = math.Random.secure().nextInt(255);
  return Color.fromARGB(255, 255, 255, 255);
}

Color randomColorVoyant() {
  var g = math.Random.secure().nextInt(255);
  var b = math.Random.secure().nextInt(255);
  var r = math.Random.secure().nextInt(255);
  return Color.fromARGB(255, 140, 73, 163);
}
