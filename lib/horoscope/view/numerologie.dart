import 'dart:convert';

import 'package:astro2/horoscope/model/NumerologieModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../bloC/modelView/numerologieController.dart';

class Numerologie extends StatefulWidget {
  Numerologie({super.key});

  @override
  State<Numerologie> createState() => _NumerologieState();
}

class _NumerologieState extends State<Numerologie> {
  bool _isLoading = false;
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  List<Content> list_numerologie = [];

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  showNormalWidget() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      appBar: AppBar(
          title: Text(
            "Compatibilité des prénoms",
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
      body: Column(
        children: <Widget>[
          Numerologie(context),
        ],
      ),
    );
  }

  Widget Numerologie(context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 80, bottom: 0, left: 30, right: 20),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/Trace.svg',
                  width: 80, height: 80, fit: BoxFit.scaleDown),
              const SizedBox(width: 25),
              SvgPicture.asset('assets/images/Main.svg',
                  width: 80, height: 80, fit: BoxFit.scaleDown),
              const SizedBox(width: 25),
              SvgPicture.asset('assets/images/Trace.svg',
                  width: 80, height: 80, fit: BoxFit.scaleDown),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Center(
          child: Text(
            'Calcul en fonction de vos prénoms',
            style: TextStyle(
              fontFamily: 'Larken Light',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 150,
          width: 360,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 234, 226, 239),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 0, left: 20, right: 20),
                child: TextFormField(
                  controller: _name1Controller,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Prénom pers. 1 ',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 141, 141, 141)),
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      bottom: 15,
                      top: 13,
                      right: 00,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, left: 20, right: 20),
                child: TextFormField(
                  controller: _name2Controller,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Prénom pers. 2 ',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 141, 141, 141)),
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      bottom: 15,
                      top: 13,
                      right: 00,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: 320,
            height: 42,
            child: ElevatedButton(
              onPressed: () async {
                var name1 = _name1Controller.text;
                var name2 = _name2Controller.text;

                attemptNumerologie(name1, name2).then((value) {
                  setState(() {
                    list_numerologie = value;
                  });
                });

                var jwt = await attemptNumerologie(name1, name2);
                if (jwt != null) {
                  showModalBottomSheet(
                      backgroundColor: Color.fromARGB(255, 140, 73, 163),
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 475,
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: PhysicalModel(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      elevation: 18,
                                      shadowColor: Colors.transparent,
                                      child: Container(
                                        height: 100,
                                        width: 130,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 0,
                                                  left: 20,
                                                  right: 20),
                                              child: Text(
                                                name1.toString(),
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: const Color.fromARGB(
                                                      255, 141, 141, 141),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  bottom: 0,
                                                  left: 20,
                                                  right: 20),
                                              child: Text(
                                                'omre',
                                                style: TextStyle(
                                                  fontFamily: 'Larken Bold',
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 68, 0, 107),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  PhysicalModel(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    elevation: 18,
                                    shadowColor: Colors.transparent,
                                    child: SizedBox(
                                      height: 100,
                                      width: 130,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 0,
                                                left: 20,
                                                right: 20),
                                            child: Text(
                                              name2.toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Color.fromARGB(
                                                    255, 141, 141, 141),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5,
                                                bottom: 0,
                                                left: 20,
                                                right: 20),
                                            child: Text(
                                              '3',
                                              // list_numerologie[0]
                                              //   .number2!
                                              // .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Larken Bold',
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromARGB(
                                                    255, 68, 0, 107),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              const Divider(
                                color: Color.fromARGB(255, 68, 0, 107),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 16, left: 16),
                                child: Container(
                                  width: ScreenUtil().setWidth(375),
                                  height: ScreenUtil().setHeight(190),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      list_numerologie[0].content ?? '',
                                      style: TextStyle(
                                        fontFamily: 'Larken Light',
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 30,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(color: Color.fromARGB(255, 68, 0, 107)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, left: 20, right: 20),
                                child: SizedBox(
                                  width: 143,
                                  height: 43,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              side: BorderSide(
                                                  color: Colors.transparent))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                    ),
                                    child: Text(
                                      'Retour',
                                      style: GoogleFonts.poppins(
                                        color: Color.fromARGB(255, 68, 0, 107),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  displayDialog(context, "An Error Occurred",
                      "Veuillez remplir les champs correctement");
                }

                print("taped");
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.transparent))),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 140, 73, 163),
                ),
              ),
              child: Text(
                'Calculer',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0, right: 0),
          child: Container(
            height: 250,
            width: 360,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 95),
                  child: Text(
                    'Comment ça marche?',
                    style: TextStyle(
                      fontFamily: 'Larken Bold',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Chaque lettre de votre prénom est représentée par un nombre de 1 à 9. Pour savoir si vos prénoms sont compatibles sentimentalement, vous devez calculer votre chiffre intime et celui de votre partenaire et voir si les deux vont ensemble. Il suffit de taper vos prénoms pour effectuer le test de compatibilité amoureuse.',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<Content>> attemptNumerologie(String name1, String name2) async {
    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-compatibilite-prenom';

    return await http.post(Uri.parse(_myUrl),
        body: {"name1": name1, "name2": name2}).then((response) {
      NumerologieModel numerologieModel =
          NumerologieModel.fromJson(json.decode(response.body));
      print(numerologieModel.content![0].content);
      List<Content> list_numerologie = [];
      for (int i = 0; i < numerologieModel.content!.length; i++) {
        list_numerologie.add(numerologieModel.content![i]);
        print(list_numerologie[i].content);
      }
      return list_numerologie;
    });
  }

  Future<NumerologieModel> getNumerologie(String name1, var name2) async {
    print('OmraneJalledTestGetIdUser');

    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-compatibilite-prenom';
    final response = await http.post(Uri.parse(_myUrl), body: {
      'name2': name2,
      'name1': name1,
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body.toString());
      print(data['content']);
      setState(() {
        var value = data;
      });

      return NumerologieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
