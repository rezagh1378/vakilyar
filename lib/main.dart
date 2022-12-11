
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vakilyar/router/app_pages.dart';
import 'package:vakilyar/router/app_routes.dart';
import 'package:vakilyar/utils/prefrence.dart';
import 'package:vakilyar/utils/storag.dart';

import 'module/constans.dart';


Future<void> main() async {

  runApp( MyApp());

  // SystemChrome.setEnabledSystemUIOverlays([]);
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await SimpleUserPreferences.init();
  await SimpleUserStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        unselectedWidgetColor: itemTextFeild,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateColor.resolveWith((states) => bl),
          splashRadius: .25,

        ),
          scaffoldBackgroundColor: Color(0xFF000000),
          primaryColor: Colors.red,
          primarySwatch: primaryBl,
          textTheme: TextTheme(
              subtitle1: TextStyle(
                  fontSize: 16,
                  color: itemTextFeild.withOpacity(1),
                  fontFamily: 'vazir'),
              headline1: TextStyle(
                  fontSize: 105, color: Colors.white, fontFamily: 'ir'),
              bodyText1: TextStyle(
                  fontSize: 16, color: bl.withOpacity(1), fontFamily: 'vazir',shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 3.0,
                  color: white.withOpacity(1),
                ),
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 8.0,
                  color: bl.withOpacity(1),
                ),
              ],),
              headline2: TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'vazir'),
              headline3: TextStyle(
                fontFamily: 'titr',
                fontSize: 25,
                color: white.withOpacity(1),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0, 0),
                    blurRadius: 3.0,
                    color: white.withOpacity(1),
                  ),
                  Shadow(
                    offset: Offset(0, 0),
                    blurRadius: 8.0,
                    color: bl.withOpacity(1),
                  ),
                ],
              ),
          overline: TextStyle(
              fontSize: 10, color: bl.withOpacity(1), fontFamily: 'vazir'),
            button: TextStyle(
                fontSize: 18, color: bg, fontFamily: 'titr',),
          ),
        appBarTheme: AppBarTheme(
          backgroundColor: bg,centerTitle: false,
        )
      ),

      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,

    );
  }
}
