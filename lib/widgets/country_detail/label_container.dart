import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  final String label;
  final String value;

  LabelContainer(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              color: Color(0xff797E84),
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff001732),
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
