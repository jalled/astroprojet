import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:astro2/astroProfileRegister/registerStepThree.dart';

class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({Key? key}) : super(key: key);

  @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo>
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
                  "Sexe",
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
                padding: const EdgeInsets.all(35.0),
                child: Image.asset(
                  "assets/images/SexeGroup.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 6),
              child: SizedBox(
                width: 341,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    // foregroundColor:
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 140, 73, 163)),
                  ),
                  child: Text(
                    'Homme',
                    style: GoogleFonts.adventPro(
                      color: const Color.fromARGB(255, 68, 0, 107),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: SizedBox(
                width: 341,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  style: ButtonStyle(
                    //foregroundColor:
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 232, 232, 232)),
                  ),
                  child: Text(
                    'Femme',
                    style: GoogleFonts.adventPro(
                      color: const Color.fromARGB(255, 68, 0, 107),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 50, bottom: 0),
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
                    width: 260,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterStepThree()),
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
