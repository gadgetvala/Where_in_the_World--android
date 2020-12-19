import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

import './providers/ThemesChanger.dart';
import './providers/Countries.dart';
import './providers/Continents.dart';
import './providers/Bookmarks.dart';
import './providers/Settings.dart';

import './screens/country_details_screen.dart';
import './screens/country_list_screen.dart';
import './screens/error_screen.dart';
import './screens/settings_screen.dart';

import 'screens/bottomDrawer.dart';
import './widgets/loadingPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Settings(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider(
          create: (_) => Continents(),
        ),
        ChangeNotifierProvider(
          create: (_) => Countries(),
        ),
        ChangeNotifierProvider(
          create: (_) => Bookmarks(),
        ),
      ],
      child: FutureBuilder(
        future: Hive.openBox('countryapp'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return ErrorScreen(snapshot.error.toString());
            else {
              Provider.of<Bookmarks>(context).loadBookMarksFromDataBase();
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                home: BottomDrawer(),
                routes: {
                  CountryList.routeName: (ctx) => CountryList(),
                  CountryDetailsScreen.routeName: (ctx) =>
                      CountryDetailsScreen(),
                  SettingsScreen.routeName: (ctx) => SettingsScreen(),
                },
              );
            }
          } else
            return LoadingPage();
        },
      ),
    );
  }
}
