import 'package:flutter/material.dart';

class Themes {
  static Map<String, dynamic> lightTheme = {
    // Global Style
    'canvasColor': Color.fromRGBO(255, 250, 245, 1),

    // AppBar Style
    'appbar': Color(0xff488FFF),
    'appbarHeading': Color(0xff000000),
    'appbarHeadingWeight': FontWeight.w600,
    'appbarIconColor': Color(0xff000000),

    // Bottom Navigation Style
    'bottomNavBGColor': Color(0xffE4E3E3),
    'bottomNavTextColor': Color(0xff000000),
    'bottomNavActiveTextColor': Color(0xffffffff),
    'bottomNavActiveColor': Colors.grey[800],

    // Text Style
    'heading': Color(0xff000000),
    'label': Color(0xff797E84),
    'labelValue': Color(0xff001732),

    // Card Style
    'cardSplashColor': Colors.amber,
    'cardBGColor': Color(0xff63A5F1),
    'cardTextColor': Color(0xff000000),
    'cardBorder': Color(0xff2D71DD),

    // List Card Style
    'listCardBGColor': Color(0xffCADAF1),
    'listCardHeadingColor': Color(0xff000000),
    'listCardSubHeadingColor': Color(0xff5E5E5E),
    'listCardBorder': Color(0xff2D71DD),
  };

  static Map<String, dynamic> darkTheme = {
    // Global Style
    'canvasColor': Color(0xff1C1C1C),

    // AppBar Style
    'appbar': Color(0xff252525),
    'appbarHeading': Color(0xffffffff),
    'appbarHeadingWeight': FontWeight.w600,
    'appbarIconColor': Color(0xffffffff),

    // Bottom Navigation Style
    'bottomNavBGColor': Color(0xff252525),
    'bottomNavTextColor': Color(0xffffffff),
    'bottomNavActiveTextColor': Color(0xff000000),
    'bottomNavActiveColor': Color(0xffffffff),

    // Text Style
    'heading': Color(0xffffffff),
    'label': Color(0xff797E84),
    'labelValue': Color(0xffFFFFFF),

    // Card Style
    'cardSplashColor': Colors.amber,
    'cardBGColor': Color(0xff252525),
    'cardTextColor': Color(0xffffffff),
    'cardBorder': Color(0xff707070),

    // List Card Style
    'listCardBGColor': Color(0xff252525),
    'listCardHeadingColor': Color(0xffffffff),
    'listCardSubHeadingColor': Color(0xffffffff),
    'listCardBorder': Color(0xff707070),
  };
}
