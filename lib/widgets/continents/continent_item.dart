import 'package:flutter/material.dart';

import '../../screens/country_list_screen.dart';

class ContinentItem extends StatelessWidget {
  final String id;
  final String name;
  final String value;
  final Color color;

  ContinentItem(this.id, this.name, this.value, this.color);

  void selectContinent(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CountryList.routeName, arguments: {
      'name': name,
      'value': value,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectContinent(context),
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            // colors: [color.withOpacity(0.7), color],
            colors: [Color(0x0ff63A5F1), Color(0xff2B6FDB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(0.1))
          ],
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
