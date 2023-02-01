import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Compatibilite extends StatefulWidget {
  const Compatibilite({super.key});

  @override
  State<Compatibilite> createState() => _CompatibiliteState();
}

class _CompatibiliteState extends State<Compatibilite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 110, 21, 14),
      appBar: AppBar(
          title: Text(
            "Compatibilité Amoureuse",
            style: TextStyle(
              fontFamily: 'Larken Bold',
              fontSize: 16,
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
              bottomRight: Radius.circular(20),
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
          // elevation: 20.00,
          backgroundColor: Color.fromARGB(255, 131, 50, 46)),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/backgroundC.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 0, left: 55, right: 30),
              child: Container(
                width: 218,
                height: 43,
                color: Colors.transparent,
                child: Text(
                  'Choisissez votre signe et celui de votre partenaire',
                  style: TextStyle(
                      fontFamily: 'Larken Bold',
                      color: Colors.white,
                      fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Votre signe',
                style: TextStyle(
                  fontFamily: 'Larken Light',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 66,
                height: 69,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: SvgPicture.asset('assets/images/Layer 1.svg',
                    width: 60, height: 60, fit: BoxFit.scaleDown),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 80,
                height: 80,
                child: SvgPicture.asset('assets/images/Coeur2.svg',
                    width: 80, height: 80, fit: BoxFit.scaleDown),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: 66,
                height: 69,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SvgPicture.asset('assets/images/Layer 1.svg',
                        width: 60, height: 60, fit: BoxFit.scaleDown),
                    SvgPicture.asset('assets/images/Layer 1.svg',
                        width: 60, height: 60, fit: BoxFit.scaleDown),
                    SvgPicture.asset('assets/images/Layer 1.svg',
                        width: 60, height: 60, fit: BoxFit.scaleDown),
                    SvgPicture.asset('assets/images/Layer 1.svg',
                        width: 60, height: 60, fit: BoxFit.scaleDown),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: 220,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Color.fromARGB(255, 192, 7, 5),
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 510,
                            child: Column(
                              children: [
                                SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    'Résultat',
                                    style: TextStyle(
                                      fontFamily: 'Larken Bold',
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Divider(
                                  color: Color.fromARGB(255, 68, 0, 107),
                                ),
                                Center(
                                  child: Text(
                                    "Vierge & Cancer",
                                    style: TextStyle(
                                      fontFamily: 'Larken Bold',
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16, left: 16),
                                  child: Container(
                                    width: ScreenUtil().setWidth(375),
                                    height: ScreenUtil().setHeight(270),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        "Vos prénoms riment avec perfection!On peut qualifier votre idylle d’idéale et ce dans tous les domaines. Vous conjuguez à merveille vos différences et vous vous servez de cette complémentarité. Le plus de votre couple est que vous vous pliez toujours en quatre pour faire plaisir à l’autre. Ne changez rien, tout est parfait !Vos prénoms riment avec perfection ! On peut qualifier votre idylle d’idéale et ce dans tous les domaines. Vous conjuguez à merveille vos différences et vous vous servez de cette complémentarité. Le plus de votre couple est que vous vous pliez toujours en quatre pour faire plaisir à l’autre. Ne changez rien, tout est parfait !     Vos prénoms riment avec perfection ! On peut qualifier votre idylle d’idéale et ce dans tous les domaines. Vous conjuguez à merveille vos différences et vous vous servez de cette complémentarité.Le plus de votre couple est que vous vous pliez toujours en quatre pour faire plaisir à l’autre. Ne changez rien, tout est parfait !",
                                        style: TextStyle(
                                          fontFamily: 'Larken Light',
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.clip,
                                        maxLines: 30,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(color: Color.fromARGB(255, 68, 0, 107)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0, bottom: 0, left: 20, right: 20),
                                  child: SizedBox(
                                    width: 143,
                                    height: 43,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color:
                                                        Colors.transparent))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                      child: Text(
                                        'Retour',
                                        style: GoogleFonts.poppins(
                                          color:
                                              Color.fromARGB(255, 68, 0, 107),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
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
                    'Suivant',
                    style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 68, 0, 107),
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
