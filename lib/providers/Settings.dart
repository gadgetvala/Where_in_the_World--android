import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  Map<String, dynamic> _settingState = {
    'darkModeToggle': false,
  };

  get settingState {
    return {..._settingState};
  }

  void setSettingState(newStateKey, newStateValue) {
    _settingState[newStateKey] = newStateValue;
    notifyListeners();
  }
}
