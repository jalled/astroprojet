import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AproposPage.dart';

class ProfilUser extends StatefulWidget {
  const ProfilUser({super.key});

  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 0, 107),
        appBar: AppBar(
            title: Text(
              "Mon Profil",
              style: TextStyle(
                fontFamily: 'Larken Bold',
                fontSize: 18,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/images/Flesh.svg',
                width: 10,
                height: 20,
                fit: BoxFit.scaleDown,
              ),
            ),
            titleSpacing: 00.0,
            centerTitle: true,
            toolbarHeight: 60.2,
            toolbarOpacity: 0.8,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            actions: <Widget>[
              SvgPicture.asset(
                'assets/images/menuicon.svg',
                width: 30,
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
              ),
            ],
            elevation: 20.00,
            backgroundColor: Color.fromARGB(255, 68, 0, 107)),
        body: Column(
          children: <Widget>[
            Profile(context),
            ProfileSigne(context),
            ThreeButton(context),
          ],
        ));
  }

  Widget Profile(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 340,
            height: 120,
            child: Row(
              children: [
                /*
                SizedBox(
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.woolha.com/media/2020/03/eevee.png'),
                    radius: 50,
                    child: Text('Eevee'),
                    foregroundColor: Colors.red,
                  ),
                ),
                */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Omrane Jalled",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "14/09/1998",
                        style: GoogleFonts.poppins(
                          color: Colors.white.withOpacity(0.25),
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ProfileSigne(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        margin: EdgeInsets.all(5.0),
        height: 64.0,
        width: 350.0,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0.9, 0.1),
              child: SvgPicture.asset('assets/images/Layer1.svg',
                  width: 31, height: 31, fit: BoxFit.scaleDown),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/Layer 1.svg',
                  width: 50, height: 50, fit: BoxFit.scaleDown),
            ),
            Column(
              children: const [
                SizedBox(height: 10),
                Align(
                  alignment: const Alignment(-0.9, 0.1),
                  child: Text(
                    "Votre signe est",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 10,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: const Alignment(-0.9, 1.6),
                  child: Text(
                    'Vierge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ThreeButton(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 0),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 341,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.transparent))),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: Text(
                '',
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 68, 0, 107),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 341,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.transparent))),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: Text(
                '',
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 68, 0, 107),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 341,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const APropos(),
                  ),
                );
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.transparent))),
                backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              child: Text(
                'A propos',
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 68, 0, 107),
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 341,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.white))),
                backgroundColor: MaterialStateProperty.all(
                  Colors.transparent,
                ),
              ),
              child: Text(
                'Déconnexion',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
