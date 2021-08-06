import 'package:flutter/material.dart';

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double radius = 45.0;
    Path path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width, 0, size.width - radius  - 5, radius / 3);
    path.lineTo(radius , size.height * 0.28);
    path.quadraticBezierTo(0, size.height * 0.32 + 2, 0, size.height * 0.4);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
