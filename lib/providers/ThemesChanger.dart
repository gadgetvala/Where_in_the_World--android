import 'package:flutter/material.dart';

import '../global/theme/theme.dart';

class ThemeChanger with ChangeNotifier {
  // Private Variables
  Map<String, dynamic> _themeData;

  // Constructor
  ThemeChanger() {
    _themeData = Themes.lightTheme;
  }

  // Getter for getting theme
  get getTheme => {..._themeData};

  // Function for settings themes
  void setTheme(String mode) {
    if (mode == 'dark') {
      _themeData = Themes.darkTheme;
    } else {
      _themeData = Themes.lightTheme;
    }
    notifyListeners();
  }
}
