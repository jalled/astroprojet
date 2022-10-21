import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:astro2/astroProfileRegister/registerStepFour.dart';

class RegisterStepThree extends StatefulWidget {
  const RegisterStepThree({Key? key}) : super(key: key);

  @override
  State<RegisterStepThree> createState() => _RegisterStepThreeState();
}

class _RegisterStepThreeState extends State<RegisterStepThree>
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
                  "Date de naissance",
                  style: GoogleFonts.poppins(
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
                  "assets/images/naissance2.png",
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 160,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(1969, 1, 1),
                  onDateTimeChanged: (DateTime newDateTime) {
                    // Do something
                    setState(() {
                      // isVisible = ! isVisible;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 30, bottom: 0),
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
                    width: 230,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterStepFour()),
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
            ),
          ],
        ),
      ),
    );
  }
}
