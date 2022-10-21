import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloC/glassphormismResources.dart';

class HomeHoroscope extends StatefulWidget {
  const HomeHoroscope({super.key});

  @override
  State<HomeHoroscope> createState() => _HomeHoroscopeState();
}

class _HomeHoroscopeState extends State<HomeHoroscope>
    with TickerProviderStateMixin {
  final ScrollController _mycontroller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 68, 0, 107),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 140, 73, 163),
                leading: SvgPicture.asset(
                  'assets/images/Vector.svg',
                  width: 10,
                  height: 15,
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
                elevation: 10.0,
                // false par default
                automaticallyImplyLeading: true,
                expandedHeight: 50,
                floating: true,
                snap: true,
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    controller: _mycontroller,
                    child: Column(
                      children: <Widget>[
                        BlocProfil(context),
                        BlocShadowSigne(context),
                        TabBarHoroscope(context),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BlocProfil(context) {
    return Container(
      height: 60.0,
      width: 350.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Omran',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                '12 Sept 1998',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: OutlinedButton(
                onPressed: () {
                  //Respond to button press
                  print('Chcha');
                },
                child: Text(
                  "Mon Profile",
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 10,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31.0),
                  ),
                  side: const BorderSide(width: 2, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // BlocShadowSigne
  Widget BlocShadowSigne(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          //  border: Border.all(color: Colors.blue, width: 2.0),
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        margin: const EdgeInsets.all(5.0),
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
                  child: Text('Vierge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget TabBarHoroscope(context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    double opacityLevel = 1.0;

    return Container(
      child: Column(
        children: [
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/VIBI.png'),
                  ),
                ),
                indicatorWeight: 5.0,
                indicatorPadding:
                    EdgeInsets.only(left: 0, right: 0, top: 30, bottom: 0),
                tabs: [
                  Tab(text: "Aujourd'hui"),
                  Tab(text: "Demain"),
                  Tab(text: "Semaine"),
                  Tab(text: "Mensuel"),
                ],
              ),
            ),
          ),
          // Ligne de conduit icons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 1.0,
              width: 300.0,
              color: Colors.black,
            ),
          ),
          Container(
            child: Container(
              padding: const EdgeInsets.only(right: 40),
              height: 400,
              //width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  //----------------------------ITEM1------------------------------------
                  // ListView.builder(
                  //   itemCount: 10,
                  //   //info.length,
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return GestureDetector(
                  //       onTap: () {
                  //         // BlocProvider.of<AppCubits>(context)
                  //         //     .detailPage(info[index]);
                  //       },
                  //       child: Container(
                  //         margin: const EdgeInsets.only(right: 15, top: 10),
                  //         width: 200,
                  //         height: 300,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.white,
                  //           image: const DecorationImage(
                  //               image: NetworkImage(
                  //                   "https://www.google.com/url?sa=i&url=https%3A%2F%2Fchine.in%2Fguide%2Fastrologie-legende-des-signes_1036.html&psig=AOvVaw0Pc11XtkVuX-YR_kOvA02F&ust=1665583999949000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCND27Iuu2PoCFQAAAAAdAAAAABAc"),
                  //               fit: BoxFit.cover),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "On Ne Peut Vaincre La Nature Qu'.en Lui Obéissant.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                              //  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),
                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),
                                            const SizedBox(height: 12),
                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card three
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "C’est en lâchant prise que vous réussirez à vaincre vos peurs du lendemain. Votre entourage vous aidera dans ce sens !",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //-------------------------ITEM2------------------------------------
                  // ListView.builder(itemBuilder: (context, index) {
                  //   return ListTile(
                  //     leading: Icon(Icons.account_circle),
                  //     title: Text("Line " + (index + 1).toString()),
                  //     selectedTileColor: Colors.green[400],
                  //     onTap: () {
                  //       setState(() {
                  //         print('ClikClaQ');
                  //       });
                  //     },
                  //   );
                  // }),
                  // // item three
                  // // Text("Bye"),

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "On Ne Peut Vaincre La Nature Qu'.en Lui Obéissant.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                              //  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),

                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),

                                            const SizedBox(height: 12),

                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card three
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              // padding: const EdgeInsets.symmetric(
                                              //   vertical: 0,
                                              //   horizontal: 0,
                                              // ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "C’est en lâchant prise que vous réussirez à vaincre vos peurs du lendemain. Votre entourage vous aidera dans ce sens !",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //---------------------Scroll Core Widget Horoscope-------------------------------------------

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "On Ne Peut Vaincre La Nature Qu'.en Lui Obéissant.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du jour',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  // color: Colors.yellow[100],
                                                  // border: Border(
                                                  //     left: BorderSide(
                                                  //   color: Colors.green,
                                                  //   width: 5,
                                                  // )),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color:
                                          const Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                const SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,

                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                              //  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),

                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),

                                            const SizedBox(height: 12),

                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card three
                                                SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              // padding: const EdgeInsets.symmetric(
                                              //   vertical: 0,
                                              //   horizontal: 0,
                                              // ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "C’est en lâchant prise que vous réussirez à vaincre vos peurs du lendemain. Votre entourage vous aidera dans ce sens !",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //---------------------------------ITEM 4 ---------------------------------

                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 0, right: 0, left: 40),
                            child: Column(
                              children: [
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    height: 170,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Phrase du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "On Ne Peut Vaincre La Nature Qu'.en Lui Obéissant.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du jour',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Coeur.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Amour.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du jour

                                            Container(
                                              width: 400,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  // color: Colors.yellow[100],
                                                  // border: Border(
                                                  //     left: BorderSide(
                                                  //   color: Colors.green,
                                                  //   width: 5,
                                                  // )),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 2eme container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/ArgentLog.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/Argent.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // 3eme Container
                                const SizedBox(height: 40),
                                SizedBox(
                                  // height: 300,
                                  width: 400,
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            // Text(
                                            //   'Horoscope du Mois',
                                            //   style: Theme.of(context)
                                            //       .textTheme
                                            //       .headline6,
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/Famille.svg'),
                                                SizedBox(width: 20),
                                                SvgPicture.asset(
                                                    'assets/images/FamilleLogo.svg'),
                                              ],
                                            ),
                                            const SizedBox(height: 8),
                                            // Text Horoscope du Mois
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                              ),
                                              child: Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: ExpandText(
                                                    'Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour.,Toujours aux prises avec la sévère planète Saturne, vous vous poserez beaucoup de questions concernant votre vie de couple. Entre la fuite, les mises au point, et les rapprochements, vous aurez parfois du mal à vous situer. Mais si vos différends ne sont pas réglés rapidement, ils deviendront plus compliqués ! Célibataire, le grand amour, vous en rêvez, bien sûr... Alors, réjouissez-vous, car le Ciel pourrait bien vous en rapprocher ce jour',
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Barometre

                                const SizedBox(height: 40),
                                Container(
                                  width: 400,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Flexible(
                                    child: Card(
                                      color: Color.fromARGB(255, 68, 0, 107),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/FamilleLogo.svg'),
                                            const SizedBox(height: 4),
                                            SvgPicture.asset(
                                                'assets/images/Famille.svg'),
                                            const SizedBox(height: 12),
                                            Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Amour',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 80),
                                                      RatingBar.builder(
                                                        initialRating: 3,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card two
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Argent,Carriere ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Card three
                                                const SizedBox(height: 10),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.15),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          'Famille, Ami, Santé',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      //SizedBox(width: 25),
                                                      RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 3,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 40),
                                Glassmorphism(
                                  blur: 15,
                                  opacity: 0.2,
                                  radius: 20,
                                  child: Container(
                                    // dynamic selon le text
                                    height: 190,
                                    width: 350,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Glassmorphism(
                                          blur: 20,
                                          opacity: 0.1,
                                          radius: 30.0,
                                          child: TextButton(
                                            onPressed: () {
                                              // handle push to HomeScreen
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 340,
                                              // padding: const EdgeInsets.symmetric(
                                              //   vertical: 0,
                                              //   horizontal: 0,
                                              // ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Notre conseil du Jour',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "C’est en lâchant prise que vous réussirez à vaincre vos peurs du lendemain. Votre entourage vous aidera dans ce sens !",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
