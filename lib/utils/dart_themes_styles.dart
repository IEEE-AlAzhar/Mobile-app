import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants.dart';


class Styles {

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: isDarkTheme ? primaryColor : Colors.white,

      backgroundColor: isDarkTheme ? primaryColor : Color(0xffF1F5FB),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.blueGrey : Colors.blue[300]
      ),
      indicatorColor: isDarkTheme ? Colors.blueGrey : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Colors.blue[300],

      hintColor: Colors.blue[300],

//      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
    //  hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Colors.blue[200],
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Colors.blueGrey[700] : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        color: isDarkTheme ? Color(0xff0E1D36) : Colors.blue[300],
        elevation: 0.0,
      ),
    );

  }
}