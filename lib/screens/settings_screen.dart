import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

import './../providers/Settings.dart';
import './../providers/ThemesChanger.dart';
import './../widgets/appbar/flexibleSpaceStyle.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = '/app-settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeChanger>(context);
    final settingProvider = Provider.of<Settings>(context);

    final themeData = themeProvider.getTheme;
    final currentSettingState = settingProvider.settingState;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: themeData['appbarHeading'],
            fontWeight: themeData['appbarHeadingWeight'],
          ),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceStyle(),
        iconTheme: IconThemeData(
          color: themeData['appbarIconColor'],
        ),
      ),
      backgroundColor: themeData['canvasColor'],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text('Interface'),
                  subtitle: Text('Change color scheme'),
                  trailing: FlutterSwitch(
                    width: 80.0,
                    height: 50.0,
                    toggleSize: 40.0,
                    value: currentSettingState['darkModeToggle'],
                    borderRadius: 30.0,
                    padding: 2.0,
                    activeToggleColor: Color(0xFF6E40C9),
                    inactiveToggleColor: Color(0xFF2F363D),
                    activeSwitchBorder: Border.all(
                      color: Color(0xFF3C1E70),
                      width: 6.0,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: Color(0xFFD1D5DA),
                      width: 6.0,
                    ),
                    activeColor: Color(0xFF271052),
                    inactiveColor: Colors.white,
                    activeIcon: Icon(
                      Icons.nightlight_round,
                      color: Color(0xFFF8E3A1),
                    ),
                    inactiveIcon: Icon(
                      Icons.wb_sunny,
                      color: Color(0xFFFFDF5D),
                    ),
                    onToggle: (val) {
                      bool newState = !currentSettingState['darkModeToggle'];
                      newState
                          ? themeProvider.setTheme('dark')
                          : themeProvider.setTheme('light');
                      settingProvider.setSettingState(
                          'darkModeToggle', newState);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
