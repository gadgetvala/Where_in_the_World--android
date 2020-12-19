import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import './../providers/ThemesChanger.dart';
import 'continent_overview_screen.dart';
import 'bookmark_screen.dart';

class BottomDrawer extends StatefulWidget {
  @override
  _BottomDrawerState createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  final List<Widget> _pages = [
    ContinentOverviewScreen(),
    BookmarkScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    return Scaffold(
      appBar: null,
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: themeData['bottomNavBGColor'],
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: GNav(
              color: themeData['bottomNavTextColor'],
              gap: 10,
              activeColor: themeData['bottomNavActiveTextColor'],
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: themeData['bottomNavActiveColor'],
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.bookmark_border,
                  text: 'Bookmarks',
                ),
              ],
              selectedIndex: _selectedPageIndex,
              onTabChange: (index) {
                _selectPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
