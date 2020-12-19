import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './settings_screen.dart';

import './../providers/ThemesChanger.dart';
import './../widgets/continents/continent_grid.dart';
import './../widgets/appbar/flexibleSpaceStyle.dart';

class ContinentOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeChanger>(context).getTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Continents',
          style: TextStyle(
            color: themeData['appbarHeading'],
            fontWeight: themeData['appbarHeadingWeight'],
          ),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceStyle(),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsScreen.routeName);
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: themeData['appbarIconColor'],
        ),
      ),
      body: Container(
        color: themeData['canvasColor'],
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: ContinentGrid(),
      ),
    );
  }
}
