import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Continents.dart';
import 'continent_item.dart';

class ContinentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final continentData = Provider.of<Continents>(context);
    final continentList = continentData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: continentList.length,
      itemBuilder: (ctx, i) => ContinentItem(
        continentList[i].id,
        continentList[i].name,
        continentList[i].value,
        continentList[i].color,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 0.7,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
