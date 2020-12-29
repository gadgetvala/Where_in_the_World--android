import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../providers/Countries.dart';
import './../providers/ThemesChanger.dart';
import './../screens/scearch_screen.dart';
import './../widgets/appbar/flexibleSpaceStyle.dart';
import './../widgets/country_list_page/country_list_tile.dart';

class CountryList extends StatefulWidget {
  static const routeName = '/country-list';

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  Future<bool> onPressedBackButton() {
    Provider.of<Countries>(context, listen: false).setEmpty();
    Navigator.pop(context);
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final name = routeArgs['name'];
    final value = routeArgs['value'];

    Provider.of<Countries>(context).setCountries(value);
    final data = Provider.of<Countries>(context, listen: false).country;
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    return WillPopScope(
      onWillPop: onPressedBackButton,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: TextStyle(
              color: themeData['appbarHeading'],
              fontWeight: themeData['appbarHeadingWeight'],
            ),
          ),
          centerTitle: true,
          flexibleSpace: FlexibleSpaceStyle(),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchScreen(data),
                );
              },
            ),
          ],
          iconTheme: IconThemeData(
            color: themeData['appbarIconColor'],
          ),
        ),
        backgroundColor: themeData['canvasColor'],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (data.length == 0)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (data.length != 0)
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (ctx, i) => CountryListTile(
                    data[i]['name'],
                    data[i]['population'].toString(),
                    data[i]['flag'],
                    data[i]['alpha3Code'],
                    'country',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
