import 'dart:convert';

import 'package:astro2/astroProfileRegister/profileUser.dart';
import 'package:astro2/astro_Home/bloC/helper/constant.dart';
import 'package:astro2/astro_Home/view/story_feed/story_feed_view.dart';
import 'package:astro2/horoscope/view/compatibilite.dart';
import 'package:astro2/horoscope/view/home_horoscope.dart';
import 'package:astro2/horoscope/view/numerologie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_horizontal_featured_list/flutter_horizontal_featured_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../horoscope/view/commpatibiliteTest.dart';
import '../../horoscope/view/voyanceParTel.dart';
import '../../profil_Voyants/model/VoyanteModel.dart';
import '../../profil_Voyants/view/profil_Voyants.dart';
import '../bloC/annimation/page-routes-animatiom.dart';

import 'package:rect_getter/rect_getter.dart';

import '../bloC/app_Data/story_data.dart';
import 'home_view/widgets/user_story_item.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _TestBestState();
}

class _TestBestState extends State<Home> with TickerProviderStateMixin {
  List<Color> colors = List.generate(20, (index) => randomColor());

  // ----------------------Card Voyants --------------------------------------
  String? cardGroupResult;
  String? cardGroupResult2;
  String? cardGroupResult3;
  String? singleCardResult;
  String? selectSlideResult;
  String? selectSlideResult2;
  List<VoyantObject> list_voyante_Home = [];
  bool _isLoading = false;

  //------------------------------------------

  final ScrollController _mycontroller = new ScrollController();

  // Story Variable

  GlobalKey<RectGetterState> reactGetterkey = RectGetter.createGlobalKey();
  Rect? rect;
  AnimationController? storyAnimationController;
  Animation? storycolorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    attempHome().then((value) {
      setState(() {
        list_voyante_Home = value;
      });
    });
    storyAnimationController =
        AnimationController(vsync: this, duration: animatonDuration);
    storycolorAnimation = ColorTween(begin: Colors.black12, end: Colors.black)
        .animate(storyAnimationController!);
    storyAnimationController!.addListener(() {
      setState(() {});
    });
  }

  // on Story Item Tap Func
  void onStoryItemTap(reactpoint, index) {
    setState(() => rect = reactpoint);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() =>
          rect = rect!.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      storyAnimationController!.forward();
      Future.delayed(animatonDuration, () {
        Navigator.of(context)
            .push(
              FadeRouteBuilder(
                page: StoryFeedView(
                    stories: stories, herotagString: 'index$index'),
              ),
            )
            .then((value) => setState(() => rect = null));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 68, 0, 107),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Color.fromARGB(255, 140, 73, 163),

                leading: SvgPicture.asset(
                  'assets/images/Vector.svg',
                  width: 15,
                  height: 15,
                  fit: BoxFit.scaleDown,
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
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      controller: _mycontroller,
                      child: Column(
                        children: <Widget>[
                          BlocProfil(context),
                          BlocShadowSigne(context),
                          CercleDeSigne(context),
                          CompatibleAmour(context),
                          TopVoyants(context),
                          StoryAstro(context),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
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
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilUser(),
                  ),
                );
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

  Widget CercleDeSigne(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 0),
      child: Container(
        width: 339,
        height: 360,
        child: Stack(
          children: <Widget>[
            new SvgPicture.asset('assets/images/rou47.svg',
                color: Colors.white, height: 360, width: 360),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: new Image.asset('assets/images/RectangleRRR.png',
                  color: Color.fromARGB(255, 68, 0, 107),
                  width: 500,
                  height: 500),
            ),
            Positioned(
              top: 235,
              left: 0,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isLoading = true;
                  });

                  Future.delayed(const Duration(seconds: 5));

                  setState(() {
                    _isLoading = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeHoroscope(),
                      ),
                    );
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(0.1, -0.9),
                        child: Text(
                          'Horoscope',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 0, top: 40, left: 7, right: 5),
                            child: Image.asset(
                              'assets/images/Maskgroup.png',
                              width: 100,
                              height: 75,
                              fit: BoxFit.fitWidth,
                            ),
                          )),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 140, 73, 163),
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(width: 3.0, color: Colors.transparent)),
                ),
              ),
            ),
            Positioned(
              top: 235,
              left: 120,
              child: InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VoyanceTelScreen(),
                    ),
                  );
                }),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.1, -0.9),
                        child: Text(
                          'Voyance Tel',
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: const Color.fromARGB(255, 140, 73, 163)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32, bottom: 0),
                        child: Image.asset(
                            'assets/images/ezgif.com-gif-maker.gif',
                            width: 50,
                            height: 45),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(width: 3.0, color: Colors.transparent)),
                ),
              ),
            ),
            Positioned(
              top: 235,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Numerologie(),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(width: 3.0, color: Colors.transparent)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Numérologie',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 68, 0, 107),
                          ),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 29),
                            child: Image.asset(
                              'assets/images/Group3.png',
                              width: 70,
                              height: 50,
                              fit: BoxFit.fitWidth,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CompatibleAmour(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, left: 25, top: 0, bottom: 20),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 0, left: 85, top: 10, bottom: 0),
            child: Text(
              "Compatibility amours",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompatibiliteParSigne(),
                ),
              );
            },
            child: Container(
              width: 339,
              height: 120,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/Backgr.svg',
                    fit: BoxFit.contain,
                    // alignment: Alignment.center,

                    // maxWidth of the screen
                    //width: MediaQuery.of(context).size.width,

                    // Maxheight of the screen
                    //height: MediaQuery.of(context).size.height,
                    allowDrawingOutsideViewBox: false,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 40, top: 45, bottom: 0),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),

                    // image: new DecorationImage(
                    //   image: new AssetImage("assets/images/vv.png"),
                    // ),
                  ),
                  child: SvgPicture.asset('assets/images/Layer 1.svg',
                      width: 50, height: 50, fit: BoxFit.scaleDown),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 0, left: 135, top: 45, bottom: 0),
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: new DecorationImage(
                      image: new AssetImage(
                        "assets/images/ww.png",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  //-------------------------------------Card View Top Voyants__________________________________________________

  Widget TopVoyants(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 0, bottom: 0),
      child: Column(
        children: [
          SizedBox(
            width: 380,
            height: 300,
            child: Column(
              children: [
                Align(
                  alignment: const Alignment(-0.7, 0.2),
                  child: Text("TOP voyants",
                      style: TextStyle(
                        fontFamily: 'Larken Light',
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                HorizontalFeaturedList(
                  itemHeight: 200,
                  itemWidth: 170,
                  itemColorBuilder: (context, index) => colors[index],
                  // itemCount: colors.length,
                  itemCount: list_voyante_Home.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                'https://api.aveniroscope.com/${list_voyante_Home[index].avatarPath.toString()}',
                                fit: BoxFit.cover,
                                height: 110,
                                width: double.infinity,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Expanded(
                          child: Align(
                            alignment: const Alignment(-0.1, -0.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      list_voyante_Home[index].nom.toString(),
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    SvgPicture.asset('assets/images/state.svg'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: const Alignment(-0.7, -0.5),
                                  child: Text(
                                    'Tarologue-Voyant',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  onPressedItem: () {},
                  onPressedSeeAll: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilVoyantsAndTchats(),
                      ),
                    );
                  },
                  seeAllText: 'Voir Plus ',
                  titleText: '',
                  // titleText: 'Top Voyants',
                  // seeAllText: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//------------------Widget Story -----------------------------
  Widget StoryAstro(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 0, bottom: 0),
      child: Container(
        width: 380,
        height: 140,
        child: Column(
          children: [
            Align(
              alignment: const Alignment(-0.7, 0.6),
              child: Text(
                "Daily Tipo for virgo",
                style: TextStyle(
                  fontFamily: 'Larken Light',
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 70.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                itemBuilder: (context, index) {
                  return UserStoryItem(
                    setRectPoint: (rectpoint) {
                      print(rect);
                      setState(() {
                        rect = rectpoint;
                      });
                      onStoryItemTap(rect, index);
                    },
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---------------------------func to see-----------------------------------------------

/*
  Widget rippleAnimation() {
    if (rect == null) {
      return const Offstage();
    }
    return AnimatedPositioned(
      left: rect!.left,
      right: MediaQuery.of(context).size.width - rect!.right,
      top: rect!.top,
      bottom: MediaQuery.of(context).size.height - rect!.bottom,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: storycolorAnimation!.value,
        ),
      ),
      duration: animatonDuration,
    );
  }
  */

  Future<List<VoyantObject>> attempHome() async {
    const _myUrl = 'https://api.aveniroscope.com/mobile/get-voyant-by-note';

    return await http.post(Uri.parse(_myUrl)).then((response) {
      Voyants voyants = Voyants.fromJson(json.decode(response.body));
      print(voyants.voyant[0].id);
      List<VoyantObject> list_voyante_Home = [];

      for (int i = 0; i < voyants.voyant.length; i++) {
        list_voyante_Home.add(voyants.voyant[i]);
        print(list_voyante_Home[i].nom);
      }
      return list_voyante_Home;
    });
  }
}

Color randomColor() {
  var g = math.Random.secure().nextInt(255);
  var b = math.Random.secure().nextInt(255);
  var r = math.Random.secure().nextInt(255);
  return Color.fromARGB(255, 140, 73, 163);
}
