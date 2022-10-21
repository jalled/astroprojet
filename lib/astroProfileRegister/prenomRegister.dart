
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileRegister extends StatefulWidget {

  const ProfileRegister({Key? key}) : super(key: key);

  @override
  State<ProfileRegister> createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {


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
              "Votre prénom",

              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Positioned(
            top: 110,
            right: 10,
            left: 10,
            child: Image.asset(
              "assets/images/step1.png",
            ),
          ),
          Positioned(
            top: 80,
            right: 10,
            left: 10,
            child: Image.asset(
              "assets/images/Vector.png",
            ),
          ),
          Positioned(
            bottom:160 ,
            right:10 ,
            left: 10,
           child: TextFormField(
             style: const TextStyle(
               color: Color.fromARGB(255, 128, 128, 128),
             ),

              initialValue: 'Votre prénom',
              decoration: const InputDecoration(
                fillColor: Colors.white,
               filled: true,


               // labelText: 'Votre prénom',
                isDense: true,

                errorText: 'Error message',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                  left: 5, bottom: 15, top: 13, right: 5
                ),

              ),
            ),
          ),




        ],


      ),



    );

  }

}

