import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../providers/ThemesChanger.dart';
import '../../screens/country_list_screen.dart';

class ContinentItem extends StatelessWidget {
  final String id;
  final String name;
  final String value;
  final Color color;

  ContinentItem(this.id, this.name, this.value, this.color);

  void selectContinent(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CountryList.routeName, arguments: {
      'name': name,
      'value': value,
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    return InkWell(
      onTap: () => selectContinent(context),
      splashColor: themeData['cardSplashColor'],
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          color: themeData['cardBGColor'],
          border: Border.all(
            color: themeData['cardBorder'],
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeData['cardTextColor']),
          ),
        ),
      ),
    );
  }
}
