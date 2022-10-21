import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:astro2/astroProfileRegister/RegisterStepFive.dart';

class RegisterStepFour extends StatefulWidget {
  const RegisterStepFour({Key? key}) : super(key: key);

  @override
  State<RegisterStepFour> createState() => _RegisterStepFourState();
}

class _RegisterStepFourState extends State<RegisterStepFour>
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
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Heure de votre naissance",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  "assets/images/step1.png",
                  scale: 0.8,
                  height: 4,
                  width: 300,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  "assets/images/Naissance.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                height: 160,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  onDateTimeChanged: (value) {},
                  initialDateTime: DateTime.now(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 40, bottom: 0),
              child: Text(
                'Les étoiles vous guident, découvrez ce \n         que votre signe vous cache',
                style: GoogleFonts.poppins(
                  color: Colors.white,
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
                      left: 0, right: 0, top: 50, bottom: 0),
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
                      left: 0, right: 0, top: 50, bottom: 0),
                  child: SizedBox(
                    width: 260,
                    height: 60,
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
                        // foregroundColor:
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Suivant',
                        style: GoogleFonts.adventPro(
                          color: const Color.fromARGB(255, 68, 0, 107),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}