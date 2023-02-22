import 'package:flutter/material.dart';
import 'package:packmore/master_components/constants.dart';

final ThemeData appTheme = ThemeData(
  // brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
  textTheme: const TextTheme(bodyMedium: TextStyle(color: kTextColor)),
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  //Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kPrimaryLightColor,
      backgroundColor: kPrimaryColor,
      elevation: 0,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  //Input Field Theme
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    contentPadding:
        EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);
