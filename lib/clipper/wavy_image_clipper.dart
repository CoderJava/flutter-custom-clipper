import 'package:flutter/material.dart';

class WavyImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 200);
    var firstControlPoint = Offset(0, size.height - 160);
    var firstEndPoint = Offset(30, size.height - 150);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width - 30, size.height - 50);
    var secondControlPoint = Offset(size.width, size.height - 40);
    var secondEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    var dyThird = 200.0;
    path.lineTo(size.width, dyThird);
    var thirdControlPoint = Offset(size.width, dyThird - 40);
    var thirdEndPoint = Offset(size.width - 30, dyThird - 50);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    path.lineTo(30, 50);
    var fourthControlPoint = Offset(0, 40);
    var fourthEndPoint = Offset(0, 0);
    path.quadraticBezierTo(
      fourthControlPoint.dx,
      fourthControlPoint.dy,
      fourthEndPoint.dx,
      fourthEndPoint.dy,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}