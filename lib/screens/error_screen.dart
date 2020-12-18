import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String _text;

  ErrorScreen(this._text);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
            child: Text(_text),
          ),
        ),
      ),
    );
  }
}
