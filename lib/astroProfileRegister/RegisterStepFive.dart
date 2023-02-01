import 'package:astro2/astroProfileRegister/registerStepFour.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStepFive extends StatefulWidget {
  const RegisterStepFive({Key? key}) : super(key: key);

  @override
  State<RegisterStepFive> createState() => _RegisterStepFiveState();
}

class _RegisterStepFiveState extends State<RegisterStepFive>
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 0, bottom: 0),
                  child: Image.asset(
                    "assets/images/loading.gif",
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 0, bottom: 0),
                  child: Image.asset(
                    "assets/images/Group44.png",
                    height: 220,
                    width: 220,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 0, bottom: 0),
                    child: SizedBox(
                      width: 340,
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
                        child: Text('Suivantd',
                            style: TextStyle(
                              fontFamily: 'Larken Bold',
                              color: const Color.fromARGB(255, 68, 0, 107),
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
