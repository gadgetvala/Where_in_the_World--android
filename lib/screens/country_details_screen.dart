import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../providers/Countries.dart';
import './../providers/Bookmarks.dart';
import '../providers/ThemesChanger.dart';

import './../widgets/appbar/flexibleSpaceStyle.dart';
import './../widgets/country_detail/label_container.dart';
import './../widgets/country_detail/image_container.dart';

class CountryDetailsScreen extends StatelessWidget {
  static String routeName = '/country-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final countryCode = routeArgs['code'];
    final countryName = routeArgs['name'];
    final from = routeArgs['from'];
    var countryData;
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    if (from == 'bookmark') {
      countryData = Provider.of<Bookmarks>(context, listen: false)
          .countryDetailsByCode(countryCode);
    } else {
      countryData = Provider.of<Countries>(context, listen: false)
          .countryDetailsByCode(countryCode);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          countryName,
          style: TextStyle(
            color: themeData['apappbarHeadingpbar'],
            fontWeight: themeData['appbarHeadingWeight'],
          ),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceStyle(),
        actions: [
          IconButton(
            icon: Icon(
              from == 'bookmark'
                  ? Provider.of<Bookmarks>(context, listen: false)
                          .isBookmark(countryData['alpha3Code'])
                      ? Icons.bookmark
                      : Icons.bookmark_border
                  : Provider.of<Bookmarks>(context)
                          .isBookmark(countryData['alpha3Code'])
                      ? Icons.bookmark
                      : Icons.bookmark_border,
            ),
            onPressed: () async {
              await Provider.of<Bookmarks>(context, listen: false)
                  .toggleBookmarks(countryData);

              if (from == 'bookmark') Navigator.pop(context);
            },
          ),
        ],
        iconTheme: IconThemeData(
          color: themeData['appbarIconColor'],
        ),
      ),
      backgroundColor: themeData['canvasColor'],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: EdgeInsets.all(2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: countryData['alpha3Code'],
                child: ImageContainer(countryData['flag']),
              ),
              SizedBox(height: 10),
              LabelContainer('Name:', countryData['name']),
              LabelContainer('Code:', countryData['alpha3Code']),
              LabelContainer(
                  'Calling Code:', countryData['callingCodes'][0].toString()),
              LabelContainer('Capital:', countryData['capital']),
              LabelContainer('Region:', countryData['region']),
              LabelContainer('Sub Region:', countryData['subregion']),
              LabelContainer(
                  'Population:', countryData['population'].toString()),
              LabelContainer('Total Area:', countryData['area'].toString()),
              LabelContainer('Time Zone:', countryData['timezones'][0]),
            ],
          ),
        ),
      ),
    );
  }
}
