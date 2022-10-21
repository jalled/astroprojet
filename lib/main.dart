import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro2/nav_Bar/bloC/main_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

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
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: AnnotatedRegion<SystemUiOverlayStyle>(
                          value: SystemUiOverlayStyle(
                            systemNavigationBarColor: Colors.white,
                            systemNavigationBarIconBrightness: Theme.of(context)
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
                  scaffoldBackgroundColor: Colors.white,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  primarySwatch: Colors.blue,
                ),
                home: const MainPage(),
              ),
            );
          }),
    );
  }
}
