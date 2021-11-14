import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const bg_color_1 = Color(0xffCCF28B82);
  static const bg_color_2 = Color(0xffCCFBBD05);
  static const bg_color_3 = Color(0xffCCFEF476);
  static const bg_color_4 = Color(0xffCCCBFF90);
  static const bg_color_5 = Color(0xffCCA8FFEB);
  static const bg_color_6 = Color(0xffCCCAF0F8);
  static const bg_color_7 = Color(0xffCCAECBFA);
  static const bg_color_8 = Color(0xffCCD6AEFB);
  static const bg_color_9 = Color(0xffCCFECFE8);
  static const bg_color_10 = Color(0xffCCE5C9A8);
  static const bg_color_11 = Color(0xffCCE8EAED);
  static const active_tab = Color(0xff038B73);
  static const accent_color = Color(0xff038B73);
  static const cart_item_bg = Color(0xfff9f9f9);

  static const APP_BG = Colors.white;

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Color(0xff038B73),
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : Color(0xFFFDFDFD),
        indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
        buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
        hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
        // highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
        highlightColor: isDarkTheme ? Color(0xff372901) : accent_color,
        hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
        focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme:
                isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
        textTheme: GoogleFonts.interTextTheme());
  }

  static identifyColor(int index) {
    switch (index % 11) {
      case 1:
        return Styles.bg_color_1;
      case 2:
        return Styles.bg_color_2;
      case 3:
        return Styles.bg_color_3;
      case 4:
        return Styles.bg_color_4;
      case 5:
        return Styles.bg_color_5;
      case 6:
        return Styles.bg_color_6;
      case 7:
        return Styles.bg_color_7;
      case 8:
        return Styles.bg_color_8;
      case 9:
        return Styles.bg_color_9;
      case 10:
        return Styles.bg_color_10;
      case 11:
        return Styles.bg_color_11;
      default:
        return Styles.bg_color_1;
    }
  }
}
