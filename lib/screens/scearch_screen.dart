import 'package:flutter/material.dart';

import './country_details_screen.dart';

class SearchScreen extends SearchDelegate {
  final List searchSpace;

  SearchScreen(this.searchSpace);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final newList = query.isEmpty
        ? []
        : searchSpace
            .where((el) =>
                el['name'].toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return newList.isEmpty
        ? Center(child: Text('No Result Found..'))
        : ListView.builder(
            itemCount: newList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(CountryDetailsScreen.routeName, arguments: {
                    'code': newList[index]['alpha3Code'].toString(),
                    'name': newList[index]['name'].toString(),
                    'from': 'country',
                  });
                },
                title: Text(
                  newList[index]['name'],
                ),
              );
            },
          );
  }
}
