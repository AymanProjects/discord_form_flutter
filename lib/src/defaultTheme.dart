import 'package:flutter/material.dart';

/// default color palette
final Color blue = Color(0xff7289da);
final Color darkBlue = Color(0xff353840);
final Color darkerBlue = Color(0xff323238);

/// A default theme in case the form them was not set
final ThemeData defaultTheme = ThemeData(
  /// form field theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: darkerBlue,
  ),
  textTheme: TextTheme(
    /// The form field text style
    subtitle1: TextStyle(color: Colors.white),
  ),
  scaffoldBackgroundColor: darkBlue,
  primaryColor: blue,
  accentColor: Colors.white.withOpacity(0.5),
  cursorColor: blue,
  brightness: Brightness.dark,

  /// to set the text color inside the button
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.accent,
    colorScheme: ColorScheme.dark(
      /// button text color
      secondary: Colors.white,
    ),
  ),
);
