import 'package:flutter/material.dart';

class WavyBottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 2);
    path.lineTo(10, 3);
    path.lineTo(15, 5);
    path.lineTo(20, 10);
    var firstControlPoint = Offset((size.width / 3.6) - 40, 60);
    var firstEndPoint = Offset(size.width / 3.6, 10);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo(size.width / 3.6, 10);

    var dxSecondEndPoint = size.width / 3;
    var secondControlPoint = Offset(dxSecondEndPoint + 5, -10);
    var secondEndPoint = Offset(dxSecondEndPoint + 25, 10);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    path.lineTo(dxSecondEndPoint + 25, 10);

    var dxThirdEndPoint = size.width - (size.width / 2.5);
    var thirdControlPoint = Offset(dxThirdEndPoint - 36, 60);
    var thirdEndPoint = Offset((size.width / 3) * 2 - 25, 10);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    var dxFourthEndPoint = (size.width / 3) * 2;
    var fourthControlPoint = Offset(dxFourthEndPoint + 5, -10);
    var fourthEndPoint = Offset(dxFourthEndPoint + 25, 10);
    path.quadraticBezierTo(
      fourthControlPoint.dx,
      fourthControlPoint.dy,
      fourthEndPoint.dx,
      fourthEndPoint.dy,
    );

    var dxFifthEndPoint = size.width - ((size.width / 3.6) - 40);
    var fifthControlPoint = Offset(dxFifthEndPoint, 60);
    var fifthEndPoint = Offset(dxFifthEndPoint + 40, 10);
    path.quadraticBezierTo(
      fifthControlPoint.dx,
      fifthControlPoint.dy,
      fifthEndPoint.dx,
      fifthEndPoint.dy,
    );

    path.lineTo(size.width - 20, 10);
    path.lineTo(size.width - 15, 5);
    path.lineTo(size.width - 10, 3);
    path.lineTo(size.width, 2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
