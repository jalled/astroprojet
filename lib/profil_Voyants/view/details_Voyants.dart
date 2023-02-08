import 'package:astro2/profil_Voyants/view/profil_Voyants.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DetailsVoyants extends StatefulWidget {
  DetailsVoyants({
    super.key,
    required this.valueAvatar,
    required this.valueNom,
    required this.valueText,
    required this.valueconsultation,
    this.valueprice,
  });
  String? valueAvatar;
  String? valueNom;
  String? valueText;
  String? valueconsultation;
  String? valueprice;

  @override
  State<DetailsVoyants> createState() => _DetailsVoyantsState();
}

class _DetailsVoyantsState extends State<DetailsVoyants> {
  //-----------------Boking module Firebase support declaration------------------------

  final now = DateTime.now();
  late BookingService mockBookingService;

  //--------------Boking module Firebase support declaration----------------------------

  @override
  void initState() {
    //--------------Boking module Firebase support BookingService----------------------------
    super.initState();
    initializeDateFormatting().then((_) => setState(() {}));

    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  //--------------Boking module Firebase support uploadBookingMock/getBookingStreamMock----------------------------

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  //--------------Boking module Firebase support PARSE RESULT----------------------------

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  //--------------Boking module Firebase support PARSE RESULT----------------------------

  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  bool iosStyle = true;
  DateTime? _chosenDateTime;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  // Week currentWeek = Week.current();
  final List<String> weekdays = DateFormat().dateSymbols.WEEKDAYS;

  String dropdownvalue = 'Sunday';

  final ScrollController _mycontroller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: const Color.fromARGB(255, 140, 73, 163),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: const Color.fromARGB(255, 68, 0, 107),
                leading: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilVoyantsAndTchats()),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Flesh.svg',
                    width: 10,
                    height: 20,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                title: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Tchat & Voyance",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
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
                          DetailsProfil(context),
                          BookingVoyant(context),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget DetailsProfil(context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: GridTile(
              child: Image.network(
                'https://api.aveniroscope.com/${widget.valueAvatar.toString()}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,
              ),
              header: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/images/Achievement.svg'),
                    SvgPicture.asset('assets/images/Achievement.svg'),
                  ],
                ),
              ),
              footer: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Text(widget.valueNom.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/images/state.svg'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tarologue - Voyant',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Column(
                        children: [
                          RatingBar.builder(
                            updateOnDrag: true,
                            ignoreGestures: true,
                            initialRating: 1,
                            minRating: 1,
                            itemSize: 15,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.yellow,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 2),

                          Text(
                            'Consultations',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),

                          // const SizedBox(height: 3),
                          Text(
                            widget.valueconsultation.toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),  
              
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            widget.valueText.toString(),
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          width: 336,
          height: 47,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '15 min gratuites',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Au-delà de 15 min: ${widget.valueprice.toString()}€/minute',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 0, left: 25, top: 10, bottom: 0),
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 165,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 68, 0, 107)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ),

                    icon: Icon(
                      // <-- Icon
                      Icons.phone,
                      size: 24.0,
                    ),
                    label: Text('Appelez moi'), // <-- Text
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 165,
                  height: 45,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.25),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ),

                    icon: Icon(
                      // <-- Icon
                      Icons.message,
                      size: 24.0,
                    ),
                    label: Text('Tchatez'), // <-- Text
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 45),
        Center(
          child: Text(
            'Jours de disponibilité',
            style: TextStyle(
              fontFamily: 'Larken Light',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 0),
      ],
    );
  }

  Widget BookingVoyant(context) {
    return Container(
      width: 400,
      height: 600, //height to 10% of screen height, 100/10 = 0.1

      child: Center(
        child: BookingCalendar(
          availableSlotText: 'omrane',
          availableSlotColor: Color.fromARGB(255, 93, 189, 187),
          bookedSlotColor: Color.fromARGB(255, 192, 6, 4),
          pauseSlotColor: Color.fromARGB(255, 168, 119, 185),
          selectedSlotColor: Color.fromARGB(255, 218, 171, 135),
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          pauseSlots: generatePauseSlots(),
          pauseSlotText: 'LUNCH',
          hideBreakTime: false,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: const CircularProgressIndicator(),
          locale: 'en_US',
          startingDayOfWeek: StartingDayOfWeek.tuesday,
          disabledDays: const [6, 7],
        ),
      ),
    );
  }

  void getcurrentDate() {
    final weekdays = DateFormat().dateSymbols.WEEKDAYS;
    print(weekdays);
  }
}
