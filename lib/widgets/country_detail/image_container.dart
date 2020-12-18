import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainer extends StatelessWidget {
  final String image;

  ImageContainer(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Color(0x0ff63A5F1), Color(0xff2B6FDB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SvgPicture.network(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
