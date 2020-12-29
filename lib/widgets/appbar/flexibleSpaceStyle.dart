import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/ThemesChanger.dart';

class FlexibleSpaceStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<ThemeChanger>(context, listen: false).getTheme;
    return Container(
      decoration: BoxDecoration(
        color: themeData['appbar'],
      ),
    );
  }
}
