import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:astro2/astroProfileRegister/registerStepThree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterStepTwo extends StatefulWidget {
  const RegisterStepTwo({Key? key}) : super(key: key);

  @override
  State<RegisterStepTwo> createState() => _RegisterStepTwoState();
}

class _RegisterStepTwoState extends State<RegisterStepTwo>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  late AnimationController _controller;

  bool pressAttention = false;
  bool pressAttentionb2 = false;
  String sexe = '';
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString('sexe', sexe);
  }

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
                  "Sexe",
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
                    left: 0,
                    right: 0),
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
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.03,
                    bottom: 0,
                    right: 0,
                    left: 0),
                child: Image.asset(
                  "assets/images/sexelogo.png",
                  height: 160,
                  width: 160,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.05,
                  right: deviceSize.height * 0.05,
                  top: 40,
                  bottom: 0),
              child: SizedBox(
                width: deviceSize.width * 0.9,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pressAttention = !pressAttention;
                      sexe = 'Homme';
                    });
                    saveData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.all(
                      pressAttention
                          ? Color.fromARGB(255, 135, 17, 171)
                          : Color(0xff8c49a3).withOpacity(0.6),
                    ),
                  ),
                  child: Text(
                    'Homme',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.05,
                  right: deviceSize.height * 0.05,
                  top: 7,
                  bottom: 0),
              child: SizedBox(
                width: deviceSize.width * 0.9,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      pressAttentionb2 = !pressAttentionb2;
                      sexe = "femme";
                    });
                    saveData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.all(
                      pressAttentionb2
                          ? Color.fromARGB(255, 135, 17, 171)
                          : Color(0xff8c49a3).withOpacity(0.6),
                    ),
                  ),
                  child: Text(
                    'Femme',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
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
                              builder: (context) => const RegisterStepThree()),
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
