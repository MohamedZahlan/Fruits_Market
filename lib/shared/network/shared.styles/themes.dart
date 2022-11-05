import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black12,
  primarySwatch: defaultColor,
  fontFamily: 'Jannah',
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0.0,
    titleSpacing: 20,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    backgroundColor: Colors.black12,
    unselectedIconTheme: const IconThemeData(color: Colors.white),
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  )),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: defaultColor,
  fontFamily: 'Jannah',
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    titleSpacing: 20,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 20,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    selectedItemColor: HexColor('#53B175'),
    unselectedItemColor: HexColor('#181725'),
    unselectedIconTheme: IconThemeData(
      color: HexColor('#181725'),
    ),
    backgroundColor: HexColor('#FFFFFF'),
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  )),
);
