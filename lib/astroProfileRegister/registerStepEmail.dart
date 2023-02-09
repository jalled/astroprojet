import 'package:astro2/astroProfileRegister/registerStepTwo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterStepEmail extends StatefulWidget {
  const RegisterStepEmail({Key? key}) : super(key: key);

  @override
  State<RegisterStepEmail> createState() => _RegisterStepEmailState();
}

class _RegisterStepEmailState extends State<RegisterStepEmail>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  late AnimationController _controller;
  bool _obscureText = true;
  TextEditingController _emailfield = TextEditingController();

  TextEditingController _passwordfield = TextEditingController();

  TextEditingController _confirmpassfield = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String confirmpass = '';
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = _emailfield.text;
      password = _passwordfield.text;
      confirmpass = _confirmpassfield.text;
    });
    preferences.setString('email', email);
    preferences.setString('password', password);
    preferences.setString('confirmpassword', confirmpass);
    print("*******");
    print(email);
    print(password);
    print(confirmpass);
    print("*******");
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
                    top: deviceSize.height * 0.03,
                    bottom: 0,
                    right: 0,
                    left: 0),
                child: const Text(
                  "Email et mot de passe",
                  style: TextStyle(
                    fontFamily: 'Larken Light',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: EdgeInsets.only(
                    top: deviceSize.height * 0.02,
                    bottom: 0,
                    right: 0,
                    left: 0),
                child: Image.asset(
                  "assets/images/steps2.png",
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
                  "assets/images/Layer2.png",
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.height * 0.01,
                        right: deviceSize.width * 0.70,
                        top: deviceSize.height * 0.01,
                        bottom: 0),
                    child: Text(
                      "Adresse Email",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.05,
                          right: deviceSize.width * 0.05,
                          top: 6,
                          bottom: 0),
                      child: TextFormField(
                        controller: _emailfield,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "E-mail non valide ! ",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 128, 128, 128),
                        ),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Votre adresse email",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300),
                          constraints: BoxConstraints(
                              maxHeight: 45, maxWidth: deviceSize.width * 0.9),
                          fillColor: Colors.white,
                          filled: true,

                          isDense: true,

                          // errorText: 'Error message',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          contentPadding: EdgeInsets.only(
                            left: deviceSize.height * 0.03,
                            bottom: deviceSize.height * 0.05,
                            top: deviceSize.height * 0.01,
                            right: 00,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.height * 0.01,
                        right: deviceSize.width * 0.71,
                        top: deviceSize.height * 0.02,
                        bottom: 0),
                    child: Text(
                      "Mot de passe",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.05,
                          right: deviceSize.width * 0.05,
                          top: 6,
                          bottom: 0),
                      child: TextFormField(
                        controller: _passwordfield,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Vous devez choisir un mot de passe !";
                          } else if (value.length < 8) {
                            return "Mot de passe doit contenir au moins 8 caractères";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 128, 128, 128),
                        ),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Votre mot de passe",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300),
                          constraints: BoxConstraints(
                              maxHeight: 45, maxWidth: deviceSize.width * 0.9),
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceSize.height * 0.01,
                        right: deviceSize.width * 0.56,
                        top: deviceSize.height * 0.02,
                        bottom: 0),
                    child: Text(
                      "Confirmer Mot de passe",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: deviceSize.width * 0.05,
                          right: deviceSize.width * 0.05,
                          top: 6,
                          bottom: 0),
                      child: TextFormField(
                        controller: _confirmpassfield,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "    Entrez mot de passe valide";
                          } else if (value != _passwordfield.text) {
                            return "Les mots de passe ne correspondent pas !";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        enableSuggestions: true,
                        autocorrect: false,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 128, 128, 128),
                        ),
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Confirmer mot de passe",
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w300),
                          constraints: BoxConstraints(
                              maxHeight: 45, maxWidth: deviceSize.width * 0.9),
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceSize.height * 0.03,
                  right: deviceSize.height * 0.03,
                  top: deviceSize.height * 0.07,
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
                        if (_formKey.currentState!.validate()) {
                          saveData();
                          // Respond to button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterStepTwo()),
                          );
                        }
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
