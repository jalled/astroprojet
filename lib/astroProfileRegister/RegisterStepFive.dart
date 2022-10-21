import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class RegisterStepFive extends StatefulWidget {
  const RegisterStepFive({Key? key}) : super(key: key);

  @override
  State<RegisterStepFive> createState() => _RegisterStepFiveState();
}

class _RegisterStepFiveState extends State<RegisterStepFive> with SingleTickerProviderStateMixin {

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
        //decoration: BoxDecoration(
            //gradient: LinearGradient(
              //begin: Alignment.topRight,
              //end: Alignment.bottomLeft,
              //colors: [
               // Colors.yellow,
             //   Colors.white,
           //   ],
         //   )
       // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Visibility(
                visible : isVisible,


                  child: Padding(
                    padding: const EdgeInsets.only(left:0 ,right:0 ,top:0 ,bottom: 0 ),


                    child: Image.asset(
                   //   'assets/images/rou47.svg',
                      "assets/images/loading.gif",
                      width: 400,
                      height: 400,

                    ),

                  ),

              ),

              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(left:30 ,right:30 ,top:0 ,bottom:0 ),
                  child: Image.asset(
                    "assets/images/Group44.png",
                    height: 220,
                    width: 220,
                  ),
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                [
                  // Back


                  Padding(
                    padding: const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0 ),
                    child: SizedBox(
                      width: 340,
                      height: 62,

                      child: ElevatedButton(

                        onPressed: () {
                          // Respond to button press


                        },
                        style: ButtonStyle(

                          // foregroundColor:
                          backgroundColor:  MaterialStateProperty.all(Colors.white  ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: Text('Suivant',style: GoogleFonts.adventPro(
                          color: const Color.fromARGB(255, 68, 0, 107),
                          fontWeight: FontWeight.w500 ,
                          fontSize: 20,


                        ),),
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
