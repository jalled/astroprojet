import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/HoroscopeHiverModel.dart';
import 'package:http/http.dart' as http;

class HorscopeHiver extends StatefulWidget {
  const HorscopeHiver({super.key});

  @override
  State<HorscopeHiver> createState() => _HorscopeHiverState();
}

class _HorscopeHiverState extends State<HorscopeHiver> {
  final ScrollController _mycontroller = new ScrollController();
  static List<ContentH> listHoroscopeHiver = [];

  String _signe = '';
  late SharedPreferences sharedprefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHoroscopeHiver().then((value) {
      setState(() {
        listHoroscopeHiver = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      appBar: AppBar(
          title: Text(
            "Horoscope Hiver 2023",
            style: TextStyle(
              fontFamily: 'Larken Bold',
              fontSize: 16,
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
      body: DecoratedBox(
        decoration: const BoxDecoration(
            //image:
            //DecorationImage(image: AssetImage('assets/images/Hiver.png'))
            ),
        child: MediaQuery.removePadding(
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
                        HoroscopeHiver2023(context),
                        HoroscopeHiverCore(context),
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

  Widget HoroscopeHiver2023(context) {
    return Container(
      height: 750,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Hiver.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 450, bottom: 0, left: 30, right: 20),
            child: Text(
              "Belier, découvrez votre \n         Horoscope Hiver",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget HoroscopeHiverCore(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        /*
        
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/HiverTwo.png'),
            fit: BoxFit.cover,
          ),
        ),
        */

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 0, left: 30, right: 30),
              child: Text(
                "Amour couple",
                style: TextStyle(
                  fontFamily: 'Larken Bold',
                  color: Color.fromARGB(255, 93, 189, 187),
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 50, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 150,
                  child: Text(
                    listHoroscopeHiver.isNotEmpty
                        ? listHoroscopeHiver[0].couple.toString()
                        : '',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
              child: Text(
                "Amour célibataire",
                style: TextStyle(
                  fontFamily: 'Larken Bold',
                  color: Color.fromARGB(255, 93, 189, 187),
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 50, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 150,
                  child: Text(
                    listHoroscopeHiver.isNotEmpty
                        ? listHoroscopeHiver[0].single.toString()
                        : '',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
              child: Text(
                "Argent",
                style: TextStyle(
                  fontFamily: 'Larken Bold',
                  color: Color.fromARGB(255, 93, 189, 187),
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 50, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 150,
                  child: Text(
                    listHoroscopeHiver.isNotEmpty
                        ? listHoroscopeHiver[0].money.toString()
                        : '',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
              child: Expanded(
                child: Text(
                  "Travail",
                  style: TextStyle(
                    fontFamily: 'Larken Bold',
                    color: Color.fromARGB(255, 93, 189, 187),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 50, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 150,
                  child: Expanded(
                    child: Text(
                      listHoroscopeHiver.isNotEmpty
                          ? listHoroscopeHiver[0].work.toString()
                          : '',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 30, right: 30),
              child: Expanded(
                child: Text(
                  "Vitalité",
                  style: TextStyle(
                    fontFamily: 'Larken Bold',
                    color: Color.fromARGB(255, 93, 189, 187),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 30, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 200,
                  child: Expanded(
                    child: Text(
                      listHoroscopeHiver.isNotEmpty
                          ? listHoroscopeHiver[0].vitality.toString()
                          : '',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(255, 255, 255, 0.45),
              ),
              height: 190,
              width: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Conseil général",
                    style: TextStyle(
                      fontFamily: 'Larken Bold',
                      color: Color.fromARGB(255, 57, 119, 118),
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 0, left: 10, right: 10),
                    child: Expanded(
                      child: Text(
                        listHoroscopeHiver.isNotEmpty
                            ? listHoroscopeHiver[0].advice.toString()
                            : '',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 0, left: 30, right: 30),
              child: Expanded(
                child: Text(
                  "Nos conseils pour cette période d'hiver pour le Belier",
                  style: TextStyle(
                    fontFamily: 'Larken Bold',
                    color: Color.fromARGB(255, 93, 189, 187),
                    fontSize: 28,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, bottom: 0, left: 30, right: 30),
              child: Expanded(
                child: SizedBox(
                  width: 320,
                  height: 150,
                  child: Expanded(
                    child: Text(
                      listHoroscopeHiver.isNotEmpty
                          ? listHoroscopeHiver[0].advicePeriod.toString()
                          : '',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<ContentH>> getHoroscopeHiver() async {
    sharedprefs = await SharedPreferences.getInstance();

    _signe = sharedprefs.getString('signe')!;
    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-content-horoscope-hiver';
    print(_signe);

    return await http.post(Uri.parse(_myUrl), body: {
      "signe": _signe,
    }).then((response) {
      print(response.body.toString());

      HoroscopeHiver horoscopeHiver =
          HoroscopeHiver.fromJson(json.decode(response.body));
      List<ContentH> listHoroscopeHiver = [];
      for (int i = 0; i < horoscopeHiver.content.length; i++) {
        listHoroscopeHiver.add(horoscopeHiver.content[i]);
        print('BABABBAABBABABABA');
        print(horoscopeHiver.content[i].id);
      }

      return listHoroscopeHiver;
    });
  }
}
