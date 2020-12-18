import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
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
            child: Image.asset(
              'assets/img/loading.gif',
              height: 180,
              width: 180,
            ),
          ),
        ),
      ),
    );
  }
}
