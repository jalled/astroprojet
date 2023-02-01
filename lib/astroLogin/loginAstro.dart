import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../horoscope/model/NumerologieModel.dart';
import '../horoscope/view/numerologie.dart';

class ProfileRegister extends StatefulWidget {
  ProfileRegister({Key? key}) : super(key: key);

  @override
  State<ProfileRegister> createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {
  // loading
  bool _isLoading = false;
  //late ChatModel sourceChat;
  //late List<ChatModel> chatmodels;

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
      backgroundColor: const Color.fromARGB(255, 68, 0, 107),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 60,
            left: 17,
            right: 0,
            // a modifier with larken.ttf
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
          Positioned(
            top: 80,
            right: 10,
            left: 10,
            child: SvgPicture.asset(
              "assets/Layer.svg",
            ),
          ),
          Positioned(
            bottom: 130,
            right: 10,
            left: 10,
            child: Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    errorText: 'Error message',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(left: 5, bottom: 15, top: 13, right: 5),
                  ),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                  // initialValue: 'Votre prénom',
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    errorText: 'Error message',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(left: 5, bottom: 15, top: 13, right: 5),
                  ),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                  // initialValue: 'Votre prénom',
                ),
                TextButton(
                  onPressed: () async {
                    var email = _usernameController.text;
                    var password = _passwordController.text;

                    var jwt = await attemptLogIn(email, password);
                    // FlutterSecureStorage storage = FlutterSecureStorage();

                    if (jwt != null) {
                      // ignore: use_build_context_synchronously

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Numerologie(),
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
                    // Navigator.push(
                    //context,
                    //  MaterialPageRoute(builder: (context) => const SignUp()),
                    // );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Larken Light',
                      color: Colors.yellowAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//------------------------------------------------------------------

  Future<String> attemptLogIn(String email, String password) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
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
      //return data.fromJson(user);

    }

    return res.body;
  }
}
