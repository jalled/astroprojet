import 'dart:collection';
import 'dart:convert';

import 'package:astro2/horoscope/model/CompatibiliteSigneModel.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class CompatibiliteParSigne extends StatefulWidget {
  @override
  State<CompatibiliteParSigne> createState() => _CompatibiliteParSigneState();
}

class _CompatibiliteParSigneState extends State<CompatibiliteParSigne> {
  List<Content> list_compatibilite = [];

  bool _isLoading = true;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );

  showNormalWidget() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  final List<String> genderItems = [
    'male',
    'female',
  ];

  final List<String> SigneOneItems = [
    'Bélier',
    'Taureau',
    'Gemeaux',
    'Cancer',
    'Lion',
    'Vierge',
    'Balance',
    'Scorpion',
    'Sagitaire',
    'Capricorne',
    'Verseau',
    'Poissons',
  ];

  final List<String> SigneTwoItems = [
    'Bélier',
    'Taureau',
    'Gemeaux',
    'Cancer',
    'Lion',
    'Vierge',
    'Balance',
    'Scorpion',
    'Sagitaire',
    'Capricorne',
    'Verseau',
    'Poissons',
  ];

  String? selectedValuegender = 'male';
  String? selectedValuesigneOne = 'Cancer';
  String? selectedValuesigneTwo = 'Cancer';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 21, 14),
      appBar: AppBar(
          title: Text(
            "Compatibilité Amoureuse",
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
              bottomRight: Radius.circular(20),
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
          backgroundColor: Color.fromARGB(255, 131, 50, 46)),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/backgroundC.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 55, right: 30),
              child: Container(
                width: 218,
                height: 43,
                color: Colors.transparent,
                child: Text(
                  'Selectionner votre sexe ',
                  style: TextStyle(
                      fontFamily: 'Larken Bold',
                      color: Colors.white,
                      fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                height: 60.0,
                width: 250.0,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: DropdownButtonFormField2(
                  value: selectedValuegender,
                  decoration: InputDecoration(
                    //Add isDense true and zero Padding.
                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                    /*
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black45, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 1)),
                            */

                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    //Add more decoration as you want here
                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 30,
                  buttonHeight: 60,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                  },
                  onChanged: (value) {
                    //Do something when changing the item if you want.
                    setState(() {
                      selectedValuegender = value.toString();
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      selectedValuegender = value.toString();
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 55, right: 30),
              child: Container(
                width: 218,
                height: 43,
                color: Colors.transparent,
                child: Text(
                  'Choisissez votre signe et celui de votre partenaire',
                  style: TextStyle(
                      fontFamily: 'Larken Bold',
                      color: Colors.white,
                      fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Votre signe',
                style: TextStyle(
                  fontFamily: 'Larken Light',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: DropdownButtonFormField2(
                    value: selectedValuesigneOne,
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Votre signe',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: SigneOneItems.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedValuesigneOne = value.toString();
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedValuesigneOne = value.toString();
                      });
                      print(selectedValuesigneOne);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                'Votre signe',
                style: TextStyle(
                  fontFamily: 'Larken Light',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 70,
                  child: DropdownButtonFormField2(
                    value: selectedValuesigneTwo,
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Son signe',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: SigneTwoItems.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                      setState(() {
                        selectedValuesigneTwo = value.toString();
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedValuesigneTwo = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 220,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    var signe1 = selectedValuesigneOne.toString();
                    var signe2 = selectedValuesigneTwo.toString();
                    var gender = selectedValuegender.toString();

                    attemptCompatibilite(signe1, signe2, gender).then((value) {
                      setState(() {
                        list_compatibilite = value;
                      });
                    });

                    var jwt =
                        await attemptCompatibilite(signe1, signe2, gender);

                    if (jwt != null) {
                      showModalBottomSheet(
                          backgroundColor: Color.fromARGB(255, 192, 7, 5),
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 510,
                              child: Column(
                                children: [
                                  SizedBox(height: 8),
                                  Center(
                                    child: Text(
                                      'Résultat',
                                      style: TextStyle(
                                        fontFamily: 'Larken Bold',
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                    color: Color.fromARGB(255, 68, 0, 107),
                                  ),
                                  Center(
                                    child: Text(
                                      " ${signe1.toString()} & ${signe2.toString()} ",
                                      style: TextStyle(
                                        fontFamily: 'Larken Bold',
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 16, left: 16),
                                    child: Container(
                                      width: ScreenUtil().setWidth(375),
                                      height: ScreenUtil().setHeight(270),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Text(
                                          list_compatibilite[0]
                                              .content!
                                              .toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Larken Light',
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.clip,
                                          maxLines: 30,
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                      color: Color.fromARGB(255, 68, 0, 107)),
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
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.transparent))),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            Colors.white,
                                          ),
                                        ),
                                        child: Text(
                                          'Retour',
                                          style: GoogleFonts.poppins(
                                            color:
                                                Color.fromARGB(255, 68, 0, 107),
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
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                  ),
                  child: Text(
                    'Suivant',
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
      ),
    );
  }

  Future<List<Content>> attemptCompatibilite(
      String signe1, String signe2, String gender) async {
    const _myUrl =
        'https://api.aveniroscope.com/mobile/get-content-by-name-of-signe';

    return await http.post(Uri.parse(_myUrl), body: {
      "signe1": signe1,
      "signe2": signe2,
      "gender": gender,
    }).then((response) {
      CompatibiliteSigneModel compatibiliteSigneModel =
          CompatibiliteSigneModel.fromJson(json.decode(response.body));
      print(compatibiliteSigneModel.content![0].content);
      List<Content> list_compatibilite = [];

      for (int i = 0; i < compatibiliteSigneModel.content!.length; i++) {
        list_compatibilite.add(compatibiliteSigneModel.content![i]);
        print(list_compatibilite[i].content);
      }
      return list_compatibilite;
    });
  }
}
