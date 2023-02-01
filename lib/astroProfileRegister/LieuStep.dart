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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 0, right: 0, left: 0),
                child: Text(
                  "Lieu de naissance",
                  style: TextStyle(
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
                padding: const EdgeInsets.only(
                    top: 30, bottom: 0, right: 0, left: 0),
                child: Image.asset(
                  "assets/images/lieunais.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 90, bottom: 0, left: 16, right: 16),
              child: TextFormField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                initialValue: 'Lieu de naissance',
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.15),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    bottom: 15,
                    top: 13,
                    right: 00,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 100, bottom: 0),
              child: Text(
                'Les étoiles vous guident, découvrez ce \n         que votre signe vous cache',
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
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 90, bottom: 0),
                  child: SizedBox(
                    width: 50,
                    height: 50,
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
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 90, bottom: 0),
                  child: SizedBox(
                    width: 265,
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
                      child: Text('Suivant',
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
