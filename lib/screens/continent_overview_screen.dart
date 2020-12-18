import 'package:flutter/material.dart';

import './../widgets/continents/continent_grid.dart';
import './../widgets/appbar/flexibleSpaceStyle.dart';

class ContinentOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Continents',
          style: TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceStyle(),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: ContinentGrid(),
      ),
    );
  }
}
