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
    DateTime date = DateTime(1994, 08, 19);

    return MaterialApp(
    
      home: Stack(
        children: [
          Scaffold(
            backgroundColor: const Color.fromARGB(255, 68, 0, 107),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
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
                        height: 180,
                        width: 180,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 224,
                      width: 420,

                      // Display a CupertinoDatePicker in date picker mode.

                      child: CupertinoTheme(
                        
                          data: CupertinoThemeData(
                            textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle: TextStyle(
                                fontSize: 19,
                                color: Colors.white
                              ),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            
                            initialDateTime: date,
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.dmy,

                            use24hFormat: true,
                            // This is called when the user changes the date.
                            onDateTimeChanged: (DateTime newDate) {
                              setState(() => date = newDate);
                            },
                          )),

                      // In this example, the date is formatted manually. You can
                      // use the intl package to format the value based on the
                      // user's locale settings.
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 0),
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
                            left: 0, right: 0, top: 40, bottom: 0),
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
                            left: 0, right: 20, top: 40, bottom: 0),
                        child: SizedBox(
                          width: 320,
                          height: 62,
                          child: ElevatedButton(
                            onPressed: () {
                              // Respond to button press
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterStepFour()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
          )
        ],
      ),
    );
  }
}
