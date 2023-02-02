import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:astro2/astroProfileRegister/registerStepFour.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    final deviceSize = MediaQuery.of(context).size;

    DateTime date = DateTime(1994, 08, 19);

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
                  "Date de naissance",
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
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/images/steps3.png",
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
                  "assets/images/naissance2.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.height * 0.03,
                  top: 0,
                  bottom: 0),
              child:

                  // Display a CupertinoDatePicker in date picker mode.
                  CupertinoTheme(
                      data: const CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      child: Container(
                        height: 120,
                        width: 420,
                        child: CupertinoDatePicker(
                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,
                          dateOrder: DatePickerDateOrder.dmy,

                          use24hFormat: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() => date = newDate);
                          },
                        ),
                      )),

              // In this example, the date is formatted manually. You can
              // use the intl package to format the value based on the
              // user's locale settings.
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.height * 0.03,
                  top: deviceSize.height * 0.14,
                  bottom: 0),
              child: Text(
                "Pour connaitre votre signe astrologique, nous \n aurons besoin de votre date de naissance.",
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
                    width: 65,
                    height: 65,
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
                              builder: (context) => const RegisterStepFour()),
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
