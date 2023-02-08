import 'dart:convert';
import 'package:astro2/astro_Home/view/home.dart';
import 'package:astro2/horoscope/view/home_horoscope.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../astroProfileRegister/registerStepOne.dart';

class ProfileRegister extends StatefulWidget {
  ProfileRegister({Key? key}) : super(key: key);
  @override
  State<ProfileRegister> createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {
  // loading
  bool _isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 60,
              left: 17,
              right: 0,
              child: Text(
                "",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text('Se connecter',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              bottom: 130,
              right: 10,
              left: 10,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                        contentPadding: EdgeInsets.only(
                            left: 5, bottom: 15, top: 13, right: 5),
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 128, 128, 128),
                      ),
                      // initialValue: 'Votre prénom',
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                        contentPadding: EdgeInsets.only(
                            left: 5, bottom: 15, top: 13, right: 5),
                      ),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 128, 128, 128),
                      ),
                      // initialValue: 'Votre prénom',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var email = _usernameController.text;
                      var password = _passwordController.text;
                      var jwt = await attemptLogIn(email, password);
                      if (jwt != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      } else {
                        displayDialog(context, "An Error Occurred",
                            "No account was found matching that username and password");
                      }
                    },
                    child: Text("Log In"),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterStepOne()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'Larken Light',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------------
  Future<String> attemptLogIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("Bonjour");
    var res = await http.post(
        Uri.parse(
          "https://api.aveniroscope.com/api/login",
          // headers: {HttpHeaders.authorizationHeader: "Basic token"},
        ),
        body: {"email": email, "password": password});
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
