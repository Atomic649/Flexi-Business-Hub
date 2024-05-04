// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  // Custom text theme
  static final customTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
    ),
  );

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Kanit',
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: accent,
    colorScheme: const ColorScheme.light(primary: primary),
    iconTheme: const IconThemeData(color: primaryText),
    scaffoldBackgroundColor: primary,
    drawerTheme: DrawerThemeData(
      backgroundColor: primary,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: icons,
        fontFamily: 'Kanit',
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      backgroundColor: primary,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    ),
  );

  // dark theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Kanit',
    primaryColor: primary,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    hoverColor: divider,
    hintColor: accent,
    colorScheme: const ColorScheme.dark(primary: icons),
    iconTheme: const IconThemeData(color: icons),
    scaffoldBackgroundColor: primaryText,
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: primaryText,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: icons,
        fontFamily: 'Kanit',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      backgroundColor: primaryText,
      foregroundColor: icons,
      iconTheme: IconThemeData(color: icons),
    ),
  );
}