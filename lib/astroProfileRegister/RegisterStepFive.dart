import 'dart:convert';

import 'package:astro2/astroLogin/loginAstro.dart';
import 'package:astro2/astroProfileRegister/registerStepFour.dart';
import 'package:astro2/astro_Home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterStepFive extends StatefulWidget {
  const RegisterStepFive({Key? key}) : super(key: key);

  @override
  State<RegisterStepFive> createState() => _RegisterStepFiveState();
}

class _RegisterStepFiveState extends State<RegisterStepFive>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  late AnimationController _controller;

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  void getData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    print(shared.getString("nom"));
    print(shared.getString("prenom"));
    print(shared.getString("sexe"));
    print(shared.getString("email"));
    print(shared.getString("password"));
    print(shared.getString("datenaiss"));
    print(shared.getString("heurenaiss"));
    print(shared.getString("lieu"));
  }

  @override
  void initState() {
    super.initState();
    getData();
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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  new Image.asset('assets/images/loading.gif',
                      height: 360, width: 360),
                  /* Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: new Image.asset('assets/images/Frame.png',
                        color: Color.fromARGB(255, 68, 0, 107),
                        width: 300,
                        height: 200),
                  ), */
                ],
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 0, bottom: 0),
                  child: Image.asset(
                    "assets/images/Group.png",
                    height: 240,
                    width: 240,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0,
                        right: 0,
                        top: deviceSize.height * 0.06,
                        bottom: 0),
                    child: SizedBox(
                      width: deviceSize.width * 0.7,
                      height: 62,
                      child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences shared =
                              await SharedPreferences.getInstance();
                          var nom = shared.getString("nom");
                          var prenom = shared.getString("prenom");
                          var sexe = shared.getString("sexe");
                          var datenaiss = shared.getString("datenaiss");

                          var heurenaiss = shared.getString("heurenaiss");
                          var email = shared.getString("email");
                          var password = shared.getString("password");
                          var lieu = shared.getString("lieu");
                          var jwt = await attemptSignUp(
                              email.toString(),
                              password.toString(),
                              nom.toString(),
                              prenom.toString(),
                              heurenaiss.toString(),
                              datenaiss.toString(),
                              lieu.toString());
                          if (jwt != null) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Home(),
                                ));
                          } else {
                            displayDialog(
                                context, "An Error Occurred", "Error Data");
                          }
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
                        child: const Text('Suivant',
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

  Future<String> attemptSignUp(
      String email,
      String password,
      String first_name,
      String last_name,
      String birthTime,
      String BirthDate,
      String lieu_naissance) async {
    print("Bonjour");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var res = await http.post(
        Uri.parse(
          "https://api.aveniroscope.com/api/register",
          // headers: {HttpHeaders.authorizationHeader: "Basic token"},
        ),
        body: {
          "email": email,
          "password": password,
          "first_name": first_name,
          "last_name": last_name,
          "phoneNumber": "06523631252",
          "birthTime": birthTime,
          "birthDate": BirthDate,
          "lieu_naissance": lieu_naissance,
          "heure_inconnu": "0"
        });
    attributes:
    [
      'id',
      'email',
      'first_name',
      'last_name',
      'avatarPath',
      'isActive',
      'user_type',
      'created_at',
      'updated_at',
      'credit',
      'socketID',
      'remember_token'
    ];
    if (res.statusCode == 200) {
      // Map<String, dynamic> user = jsonDecode(res.body);
      final data = jsonDecode(res.body.toString());
      print(data['userToken']);
      print(data['signe']);

      sharedPreferences.setString("token", data['userToken']);
      sharedPreferences.setString("signe", data['signe']);
      print("****");
      print(data['signe']);
      print("****");
      //return data.fromJson(user);
    }
    return res.body;
  }
}
