import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import './../../providers/ThemesChanger.dart';
import './../../screens/country_details_screen.dart';

class CountryListTile extends StatelessWidget {
  final String countryName;
  final String population;
  final String flag;
  final String code;
  final String from;

  CountryListTile(
    this.countryName,
    this.population,
    this.flag,
    this.code,
    this.from,
  );

  void selectCountry(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CountryDetailsScreen.routeName, arguments: {
      'code': code,
      'name': countryName,
      'from': from,
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: themeData['listCardBGColor'],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: themeData['listCardBorder'],
          width: 1,
        ),
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
        ],
      ),
      child: InkWell(
        onTap: () => selectCountry(context),
        child: Row(
          children: <Widget>[
            Hero(
              tag: code,
              child: CircleAvatar(
                minRadius: 30,
                maxRadius: 30,
                child: ClipOval(
                  child: SvgPicture.network(
                    flag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    countryName,
                    style: TextStyle(
                      fontSize: 20,
                      color: themeData['listCardHeadingColor'],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Population : $population',
                    style: TextStyle(
                      fontSize: 15,
                      color: themeData['listCardSubHeadingColor'],
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
