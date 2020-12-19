import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Bookmarks with ChangeNotifier {
  List _bookmarks = [];

  List get bookmarks {
    return [..._bookmarks];
  }

  countryDetailsByCode(code) {
    final data =
        _bookmarks.firstWhere((el) => el['alpha3Code'].toString() == code);

    return data;
  }

  Future<void> loadBookMarksFromDataBase() async {
    final database = await Hive.openBox('countryapp');

    final data = await database.get('bookmarks');
    _bookmarks = json.decode(data);

    database.close();
    notifyListeners();
  }

  bool isBookmark(String code) {
    return _bookmarks.any((el) => el['alpha3Code'] == code);
  }

  Future<void> toggleBookmarks(country) async {
    final database = await Hive.openBox('countryapp');

    final existingIndex = _bookmarks
        .indexWhere((el) => el['alpha3Code'] == country['alpha3Code']);
    if (existingIndex >= 0) {
      _bookmarks.removeAt(existingIndex);
    } else {
      _bookmarks.add(country);
    }

    database.put('bookmarks', json.encode(_bookmarks));
    database.close();

    notifyListeners();
  }
}
