import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WavyBottomNavigationBarClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);

    var zeroControlPoint = Offset(((size.width / 10) - 30.w) / 2, 0);
    var zeroEndPoint = Offset((size.width / 10) - 30.w, 35.w);
    path.quadraticBezierTo(
      zeroControlPoint.dx,
      zeroControlPoint.dy,
      zeroEndPoint.dx,
      zeroEndPoint.dy,
    );

    path.lineTo(size.width / 10 - 30.w, 35.w);
    var firstControlPoint = Offset((size.width / 10) + 75.w, 160.w);
    var firstEndPoint = Offset((size.width / 10) + 150.w + 20.w, 35.w);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo((size.width / 10) + 150.w + 20.w, 35.w);

    double widthMiddleEndPoint = size.width / 2;
    double temp1 = (size.width / 10) + 150.w + 20.w;
    double temp2 = widthMiddleEndPoint - 75.w - 20.w;
    double dxFirstMiddleControlPoint = temp1 + ((temp2 - temp1).abs() / 2);
    var firstMiddleControlPoint = Offset(dxFirstMiddleControlPoint, -20.w);
    var firstMiddleEndPoint = Offset(temp2, 35.w);
    path.quadraticBezierTo(
      firstMiddleControlPoint.dx,
      firstMiddleControlPoint.dy,
      firstMiddleEndPoint.dx,
      firstMiddleEndPoint.dy,
    );
    path.lineTo(dxFirstMiddleControlPoint, 0);

    path.lineTo(widthMiddleEndPoint - 75.w - 20.w, 35.w);
    var middleControlPoint = Offset(widthMiddleEndPoint, 160.w);
    var middleEndPoint = Offset(widthMiddleEndPoint + 75.w + 20.w, 35.w);
    path.quadraticBezierTo(
      middleControlPoint.dx,
      middleControlPoint.dy,
      middleEndPoint.dx,
      middleEndPoint.dy,
    );
    path.lineTo(widthMiddleEndPoint + 75.w + 20.w, 35.w);

    double widthLastEndPoint = size.width - ((size.width / 10) + 150.w + 20.w);
    double widthLastEndPoint2 = size.width - ((size.width / 10) - 30.w);
    double temp3 = widthMiddleEndPoint + 75.w + 20.w;
    double temp4 = widthLastEndPoint;
    double dxLastMiddleControlPoint = temp3 + ((temp4 - temp3).abs() / 2);
    var lastMiddleControlPoint = Offset(dxLastMiddleControlPoint, -20.w);
    var lastMiddleEndPoint = Offset(temp4, 35.w);
    path.quadraticBezierTo(
      lastMiddleControlPoint.dx,
      lastMiddleControlPoint.dy,
      lastMiddleEndPoint.dx,
      lastMiddleEndPoint.dy,
    );
    path.lineTo(widthLastEndPoint, 35.w);

    var lastControlPoint = Offset(size.width - ((size.width / 10) + 75.w), 160.w);
    var lastEndPoint = Offset(widthLastEndPoint2, 35.w);
    path.quadraticBezierTo(
      lastControlPoint.dx,
      lastControlPoint.dy,
      lastEndPoint.dx,
      lastEndPoint.dy,
    );
    path.lineTo(widthLastEndPoint2, 35.w);

    double widthLastEndPoint3 = size.width - (((size.width / 10) - 30.w) / 2);
    var lastControlPoint2 = Offset(widthLastEndPoint3, 0);
    var lastEndPoint2 = Offset(size.width, 0.w);
    path.quadraticBezierTo(
      lastControlPoint2.dx,
      lastControlPoint2.dy,
      lastEndPoint2.dx,
      lastEndPoint2.dy,
    );

    path.lineTo(size.width, 0);
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
