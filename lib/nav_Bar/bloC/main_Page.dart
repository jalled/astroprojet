import 'package:astro2/astro_Home/view/home.dart';
import 'package:astro2/horoscope/view/home_horoscope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../profil_Voyants/view/profil_Voyants.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  List pages = [
    HomeHoroscope(),
    Home(),
    ProfilVoyantsAndTchats(),
    //CardVoyants(),
  ];
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeHoroscope();
      case 1:
        return Container(color: Colors.amber);
      case 2:
        return Container(color: Colors.blue);
      case 3:
        return Container(color: Colors.deepPurpleAccent);
        break;
      default:
        return ProfilVoyantsAndTchats();
    }
  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(_currentIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                print(_currentIndex);
              });
            },
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black54,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            elevation: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: SvgPicture.asset('assets/images/HomeIcon.svg')),
              BottomNavigationBarItem(
                  label: '', icon: SvgPicture.asset('assets/images/icon2.svg')),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset('assets/images/ChatIcon.svg')),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset('assets/images/carteIcon.svg')),
              BottomNavigationBarItem(
                  label: '',
                  icon: SvgPicture.asset('assets/images/person.svg')),
            ],
          ),
        ),
      ),
    );
  }
}