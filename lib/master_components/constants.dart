import 'package:flutter/material.dart';
import 'package:packmore/master_components/size_config.dart';

// Light theme colors
const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kDefaultPaddin = 20.0;

final headingStyle = TextStyle(
  fontSize: getProportionateScreenHeight(28),
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
  height: 1.5,
);

//form Errors
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kDOBNullError = "Please Enter your DOB";

// Dark theme colors
// const Color kDarkPrimaryColor = Color(0xFF1E2123);
// const Color kDarkPrimaryLightColor = Color(0xFF4F5357);
// const Color kDarkTextColor = Colors.white;
// const double kDarkDefaultPaddin = 20.0;