import 'package:astro2/astroProfileRegister/registerStepTwo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RegisterStepOne extends StatefulWidget {
  const RegisterStepOne({Key? key}) : super(key: key);
  @override
  State<RegisterStepOne> createState() => _RegisterStepOneState();
}
class _RegisterStepOneState extends State<RegisterStepOne>
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
                  "Votre prénom",
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
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                    bottom: 0,
                    right: 0,
                    left: 0),
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
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                    bottom: 0,
                    right: 0,
                    left: 0),
                child: Image.asset(
                  "assets/images/Vector.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.01,
                  right: deviceSize.width * 0.75,
                  top: deviceSize.height * 0.07,
                  bottom: 0),
              child: Text(
                "Prénom",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.width * 0.05,
                  right: deviceSize.width * 0.05,
                  top: 10,
                  bottom: 0),
              child: TextFormField(
                style: const TextStyle(
                  color: Color.fromARGB(255, 128, 128, 128),
                ),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Votre prénom",
                  hintStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
                  constraints: BoxConstraints(
                      maxHeight: 54, maxWidth: deviceSize.width * 0.9),
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  // errorText: 'Error message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(
                    left: deviceSize.height * 0.05,
                    bottom: deviceSize.height * 0.05,
                    top: deviceSize.height * 0.01,
                    right: 00,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.height * 0.03,
                  top: deviceSize.height * 0.12,
                  bottom: 0),
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
                      left: 0,
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
                              builder: (context) => const RegisterStepTwo()),
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