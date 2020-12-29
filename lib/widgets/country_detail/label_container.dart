import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../../providers/ThemesChanger.dart';

class LabelContainer extends StatelessWidget {
  final String label;
  final String value;

  LabelContainer(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: themeData['label'],
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Text(
            value,
            style: TextStyle(
              color: themeData['labelValue'],
              fontSize: 20,
            ),
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }
}
