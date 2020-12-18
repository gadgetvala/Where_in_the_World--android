import 'package:flutter/material.dart';

import '../models/Continent.dart';

class Continents with ChangeNotifier {
  List<Continent> _items = const [
    Continent(
      id: 'c1',
      name: 'Africa',
      value: 'africa',
      color: Colors.blueAccent,
    ),
    Continent(
      id: 'c2',
      name: 'Asia',
      value: 'asia',
      color: Colors.purple,
    ),
    Continent(
      id: 'c3',
      name: 'Europe',
      value: 'europe',
      color: Colors.purpleAccent,
    ),
    Continent(
      id: 'c4',
      name: 'Americas',
      value: 'americas',
      color: Colors.blueAccent,
    ),
    Continent(
      id: 'c5',
      name: 'Oceania',
      value: 'oceania',
      color: Colors.redAccent,
    ),
  ];

  List<Continent> get items {
    return [..._items];
  }
}
