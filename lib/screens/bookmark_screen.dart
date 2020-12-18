import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../providers/Bookmarks.dart';
import './../widgets/appbar/flexibleSpaceStyle.dart';
import '../widgets/country_list_page/country_list_tile.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allBookmarks = Provider.of<Bookmarks>(context).bookmarks;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarks',
          style: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceStyle(),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (allBookmarks.isEmpty)
            Center(
              child: Text(
                'No Bookmarks, Try adding some!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          if (allBookmarks.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: allBookmarks.length,
                itemBuilder: (ctx, i) {
                  return CountryListTile(
                    allBookmarks[i]['name'],
                    allBookmarks[i]['population'].toString(),
                    allBookmarks[i]['flag'],
                    allBookmarks[i]['alpha3Code'],
                    'bookmark',
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
