import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Countries with ChangeNotifier {
  List _country = [];

  List get country {
    return [..._country];
  }

  void setEmpty() {
    _country = [];
    notifyListeners();
  }

  Future<void> setCountries(continentvalue) async {
    try {
      final data = await http
          .get('https://restcountries.eu/rest/v2/region/$continentvalue');

      final decodedData = json.decode(data.body);
      _country = decodedData;
    } catch (err) {
      print(err);
    }
    notifyListeners();
  }

  Map<String, dynamic> countryDetailsByCode(code) {
    final Map<String, Object> data =
        _country.firstWhere((el) => el['alpha3Code'] == code);

    return data;
  }

  Future<Map> getCountryByAlphaCode(code) async {
    try {
      final url = 'https://restcountries.eu/rest/v2/alpha/$code';
      final data = await http.get(url);
      final decodedData = json.decode(data.body);
      return decodedData;
    } catch (err) {
      return {'error': err};
    }
  }
}
