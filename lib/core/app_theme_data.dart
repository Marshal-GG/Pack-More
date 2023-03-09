import 'package:flutter/material.dart';
import 'package:packmore/core/constants.dart';

ThemeData appTheme(bool isDark) => ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: isDark
          ? ColorScheme.dark(
              primary: kPrimaryLightColor,
              secondary: kPrimaryColor,
              onSecondary: kPrimaryLightColor,
              surface: Colors.grey[900]!,
              background: Colors.black87,
              onBackground: kPrimaryLightColor)
          : ColorScheme.light(
              primary: kPrimaryColor,
              secondary: kPrimaryLightColor,
              onSecondary: kPrimaryColor,
              surface: Colors.white,
              background: Colors.white,
              onBackground: kPrimaryColor,
            ),

      textTheme: const TextTheme(bodyMedium: TextStyle(color: kPrimaryColor)),
      primarySwatch: Colors.grey,
      // scaffoldBackgroundColor: isDark ? Colors.grey[800]! : Colors.white,
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
      appBarTheme: AppBarTheme(
        // backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: kPrimaryColor,
        textColor: kPrimaryColor,
        // tileColor: kPrimaryLightColor,
      ),
      //Input Field Theme
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: kPrimaryLightColor,
        iconColor: kPrimaryColor,
        prefixIconColor: kPrimaryColor,
        suffixIconColor: kPrimaryColor,
        contentPadding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
      ),
    );
