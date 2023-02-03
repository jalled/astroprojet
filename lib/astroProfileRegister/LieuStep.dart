import 'package:astro2/astroProfileRegister/RegisterStepFive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astro2/astroProfileRegister/registerStepTwo.dart';

class LieuStep extends StatefulWidget {
  const LieuStep({Key? key}) : super(key: key);

  @override
  State<LieuStep> createState() => _LieuStepState();
}

class _LieuStepState extends State<LieuStep>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.05,
                    bottom: 0,
                    right: 0,
                    left: 0),
                child: const Text(
                  "Lieu de naissance",
                  style: TextStyle(
                    fontFamily: 'Larken Light',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 0, right: 0, left: 0),
                child: Image.asset(
                  "assets/images/steps5.png",
                  scale: 0.8,
                  height: 4,
                  width: 300,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.1, bottom: 0, right: 0, left: 0),
                child: Image.asset(
                  "assets/images/lieustep.png",
                  height: 107,
                  width: 292,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.width * 0.04,
                  right: deviceSize.width * 0.3,
                  top: deviceSize.height * 0.07,
                  bottom: 0),
              child: Text(
                "Séléctionner votre lieu de naissance",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.width * 0.03,
                  top: 10,
                  bottom: 0),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Sélectionner lieu",

                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 237, 223, 223),
                      fontSize: 14,
                      fontWeight: FontWeight.w200),
                  constraints: BoxConstraints(
                      maxHeight: 54, maxWidth: deviceSize.width * 1),
                  fillColor: Color(0xff875ba0),

                  filled: true,

                  isDense: true,

                  // errorText: 'Error message',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.height * 0.03,
                  top: deviceSize.height * 0.14,
                  bottom: 0),
              child: Text(
                "Pour déterminer votre ascendant astrologique,\n  l'heure de votre naissance est cruciale",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Back
                Padding(
                  padding: EdgeInsets.only(
                      left: deviceSize.width * 0.07,
                      right: 0,
                      top: deviceSize.height * 0.06,
                      bottom: 0),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/images/BACKOUT.svg',
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: deviceSize.width * 0,
                      right: deviceSize.width * 0.087,
                      top: deviceSize.height * 0.06,
                      bottom: 0),
                  child: SizedBox(
                    width: deviceSize.width * 0.62,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterStepFive()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Text('Suivant',
                          style: TextStyle(
                            fontFamily: 'Larken Bold',
                            color: const Color.fromARGB(255, 68, 0, 107),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
