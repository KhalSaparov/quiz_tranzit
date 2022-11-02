import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 32.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 24.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      fontSize: 12.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      fontSize: 10.0,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.bold,
    ),
  );
}
