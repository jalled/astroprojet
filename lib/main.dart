import 'package:astro2/astroProfileRegister/RegisterStepFive.dart';
import 'package:astro2/astro_Home/view/home.dart';
import 'package:astro2/horoscope/bloC/modelView/horoscopeController.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness:
                    Theme.of(context).backgroundColor.computeLuminance() > 0.5
                        ? Brightness.dark
                        : Brightness.light,
                systemNavigationBarDividerColor: Colors.white,
                statusBarColor: Colors.white,
              ),
              child: MaterialApp(
                  title: 'Omrane Jalled',
                  debugShowCheckedModeBanner: false,
                  builder: (context, child) {
                    ScreenUtil.init(context);

                    return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 1.0),
                        child: AnnotatedRegion<SystemUiOverlayStyle>(
                            value: SystemUiOverlayStyle(
                              systemNavigationBarColor: Colors.white,
                              systemNavigationBarIconBrightness:
                                  Theme.of(context)
                                              .backgroundColor
                                              .computeLuminance() >
                                          0.5
                                      ? Brightness.dark
                                      : Brightness.light,
                              systemNavigationBarDividerColor: Colors.white,
                              statusBarColor: Colors.white,
                            ),
                            child: child!));
                  },
                  theme: ThemeData(
                    scaffoldBackgroundColor: Color.fromARGB(255, 68, 0, 107),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    primarySwatch: Colors.blue,
                  ),
                  home: RegisterStepFive()
                  //Home(),
                  ),
            );
          }),
    );
  }
}
