import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text.dart';

ThemeData appTheme = ThemeData(
  primaryColor: mainColor,
  backgroundColor: backgroundColor,
  fontFamily: 'YanoneKaffeesatz',
  appBarTheme: AppBarTheme(
    backgroundColor: mainColor,
    iconTheme: const IconThemeData(color: lightColor),
    toolbarTextStyle:
        semiBoldTextStyle.copyWith(fontSize: 16, color: lightColor),
    elevation: 0,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: mainColor,
    elevation: 0,
    selectedItemColor: lightColor,
    unselectedItemColor: lightColor.withOpacity(0.5),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      elevation: 0,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      textStyle: mediumTextStyle,
      shadowColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: mainColor,
      elevation: 0,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      textStyle: mediumTextStyle,
      shadowColor: Colors.transparent,
    ),
  ),
);
