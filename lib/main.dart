import 'package:expences_app/view/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // localizationsDelegates: [
      //   //لتغير العرض من اللغة الانكليزية الى اللغة العربية
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('ar', 'AE'), // English, no country code
      // ],
      theme: Themes.customLightTheme,
      home: NavigationPage(),
    );
  }
}

class Themes {
  static ThemeData customDarkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'ElMessiri',
    appBarTheme: AppBarTheme(color: Colors.blue[1000]),
    buttonColor: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'ElMessiri'),
    ),
  );
  static ThemeData customLightTheme = ThemeData(
    buttonColor: Colors.black,

    brightness: Brightness.light,
    fontFamily: 'ElMessiri',
    appBarTheme: AppBarTheme(color: Colors.white),
    textTheme: TextTheme(
      headline6: TextStyle(fontFamily: 'ElMessiri',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          ),

    ),
  );
}
