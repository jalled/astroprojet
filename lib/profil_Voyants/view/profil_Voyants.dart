import 'dart:convert';

import 'package:astro2/profil_Voyants/model/VoyanteModel.dart';
import 'package:astro2/profil_Voyants/model/VoyanteModel.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_horizontal_featured_list/flutter_horizontal_featured_list.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

import '../model/VoyanteModel.dart';
import '../model/VoyanteModel.dart';
import 'details_Voyants.dart';

class ProfilVoyantsAndTchats extends StatefulWidget {
  const ProfilVoyantsAndTchats({super.key});

  @override
  State<ProfilVoyantsAndTchats> createState() => _ProfilVoyantsAndTchatsState();
}

class _ProfilVoyantsAndTchatsState extends State<ProfilVoyantsAndTchats>
    with TickerProviderStateMixin {
  int _index = 0;
  List<VoyantObject> list_voyante = [];
  bool _isLoading = true;
  String? valueAvatar;
  String? valueNom;
  String? valueText;
  String? valueconsultation;
  String? valueprice;

  final ScrollController _mycontroller = new ScrollController();
  List<Color> colors = List.generate(20, (index) => rrandomColor());
  List<Color> colorsVoyant = List.generate(20, (index) => randomColorVoyant());

  @override
  void initState() {
    super.initState();
    showNormalWidget();
    // attemptCom();

    attemptCom().then((value) {
      setState(() {
        list_voyante = value;
      });
    });
  }

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

                title: const Align(
                  alignment: Alignment.center,
                  child: Text("Tchat & Voyance",
                      style: TextStyle(
                        fontFamily: 'Larken Bold',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      )),
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
          const Text(
            'Profils des voyants',
            style: TextStyle(
              fontFamily: 'Larken Light',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          HorizontalFeaturedList(
            itemBorderRadius: const BorderRadius.all(Radius.circular(12)),

            itemHeight: 357,
            itemWidth: 350,
            itemColorBuilder: (context, index) => colorsVoyant[index],
            itemCount: list_voyante.length,

            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 105),
                            child: Row(
                              children: [
                                Text(
                                  list_voyante[index].nom.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset('assets/images/state.svg'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 40,
                              width: 200,
                              child: Text(
                                list_voyante[index].competenceVoyant.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 0, left: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
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
                            Text(
                              list_voyante[index].consultation.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 0, right: 0, left: 0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: 132.7,
                            height: 132,
                            child: Image.network(
                                'https://api.aveniroscope.com/${list_voyante[index].avatarPath.toString()}'),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 140,
                          height: 109,
                          child: SingleChildScrollView(
                            child: Text(
                              list_voyante[index].description.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // -------------------------button here -------------------

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, bottom: 0, right: 20),
                    child: Container(
                      width: 270,
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
                                text: '15 min gratuites \n',
                                style: GoogleFonts.poppins(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        'Au delà de 15 min : ${list_voyante[index].price.toString()}€/minute',
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
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: 92,
                              height: 45,
                              child: TextButton(
                                child: Text(
                                  'Consulter',
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
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
                                  setState(() {
                                    valueNom =
                                        list_voyante[index].nom.toString();
                                    valueAvatar = list_voyante[index]
                                        .avatarPath
                                        .toString();
                                    valueText = list_voyante[index]
                                        .description
                                        .toString();
                                    valueconsultation = list_voyante[index]
                                        .consultation
                                        .toString();
                                    valueprice =
                                        list_voyante[index].price.toString();
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailsVoyants(
                                              valueAvatar: valueAvatar ?? '',
                                              valueNom: valueNom ?? '',
                                              valueText: valueText ?? '',
                                              valueconsultation:
                                                  valueconsultation ?? '',
                                              valueprice: valueprice ?? '',
                                            )),
                                  );
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
            onPressedItem: () {
              print('aaaaaaa');
            },
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
      padding: const EdgeInsets.only(top: 40, bottom: 0, right: 0, left: 0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0, right: 40, left: 0),
            child: Text('Les Voyants les mieux notes ',
                style: TextStyle(
                  fontFamily: 'Larken Light',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          ),
          HorizontalFeaturedList(
            itemBorderRadius: const BorderRadius.all(Radius.circular(12)),
            itemHeight: 260,
            itemWidth: 163,
            itemColorBuilder: (context, index) => colors[index],
            itemCount: list_voyante.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        list_voyante[index].nom.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 13, 13, 13),
                        ),
                      ),
                      const SizedBox(width: 5),
                      SvgPicture.asset('assets/images/state.svg'),
                      //  const SizedBox(width: 55),
                      // SvgPicture.asset('assets/images/like.svg'),
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
                  Image.network(
                    'https://api.aveniroscope.com/${list_voyante[index].avatarPath.toString()}',
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
                        print("card two ");
                        setState(() {
                          valueNom = list_voyante[index].nom.toString();
                          valueAvatar =
                              list_voyante[index].avatarPath.toString();
                          valueText =
                              list_voyante[index].description.toString();
                          valueconsultation =
                              list_voyante[index].consultation.toString();
                          valueprice = list_voyante[index].price.toString();
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsVoyants(
                                    valueAvatar: valueAvatar ?? '',
                                    valueNom: valueNom ?? '',
                                    valueText: valueText ?? '',
                                    valueconsultation: valueconsultation ?? '',
                                  )),
                        );
                        // Respond to button press
                      },
                      icon: Icon(Icons.chat, size: 18, color: Colors.white),
                      label: Text(
                        "Consulter",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
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
        itemBorderRadius: const BorderRadius.all(Radius.circular(12)),

        itemHeight: 260,
        itemWidth: 163,
        itemColorBuilder: (context, index) => colors[index],
        itemCount: list_voyante.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Row(
                children: [
                  Text(
                    list_voyante[index].nom.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 13, 13, 13),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset('assets/images/state.svg'),
                  //   const SizedBox(width: 55),
                  //   SvgPicture.asset('assets/images/like.svg'),
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
              Image.network(
                'https://api.aveniroscope.com/${list_voyante[index].avatarPath.toString()}',
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
                    setState(() {
                      valueNom = list_voyante[index].nom.toString();
                      valueAvatar = list_voyante[index].avatarPath.toString();
                      valueText = list_voyante[index].description.toString();
                      valueconsultation =
                          list_voyante[index].consultation.toString();
                      valueprice = list_voyante[index].price.toString();
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsVoyants(
                                valueAvatar: valueAvatar ?? '',
                                valueNom: valueNom ?? '',
                                valueText: valueText ?? '',
                                valueconsultation: valueconsultation ?? '',
                                valueprice: valueprice ?? '',
                              )),
                    );
                  },
                  icon: Icon(Icons.chat, size: 18, color: Colors.white),
                  label: Text(
                    "Consulter",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onPressedItem: () {
          print('iteam pressed');
        },
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
                            style: TextStyle(
                              fontFamily: 'Larken Light',
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

  Future<List<VoyantObject>> attemptCom() async {
    const _myUrl = 'https://api.aveniroscope.com/mobile/get-voyant-by-note';

    return await http.post(Uri.parse(_myUrl)).then((response) {
      Voyants voyants = Voyants.fromJson(json.decode(response.body));
      print(voyants.voyant[0].id);
      List<VoyantObject> list_voyante = [];

      for (int i = 0; i < voyants.voyant.length; i++) {
        list_voyante.add(voyants.voyant[i]);
        print(list_voyante[i].nom);
      }
      return list_voyante;
    });
  }

  showNormalWidget() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
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
