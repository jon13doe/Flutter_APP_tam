import 'package:flutter/material.dart';

const Color black = Colors.black;
const Color white = Colors.white;

final customDarkTheme = ThemeData.dark().copyWith(
  primaryColor: black,
  appBarTheme: const AppBarTheme(
    backgroundColor: black,
  ),

);




final customLightTheme = ThemeData.light().copyWith(
  primaryColor: white,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    actionsIconTheme: IconThemeData(size: 40, color: black,),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      size: 32,
    ),
    selectedItemColor: black,
    selectedLabelStyle: TextStyle(
      color: black,
    ),
    showUnselectedLabels: true,
    unselectedLabelStyle: TextStyle(
      color: Colors.grey,
    ),
    unselectedItemColor: Colors.grey,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
  ),

);