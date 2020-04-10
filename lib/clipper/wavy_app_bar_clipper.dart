import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WavyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    double middleWidth = size.width / 2;

    path.lineTo(middleWidth - 64.w - 30.w - 10.w, size.height);
    path.lineTo(middleWidth - 64.w - 30.w, size.height - 6.w);
    var middleControlPoint = Offset(middleWidth, size.height - 135.w);
    var middleEndPoint = Offset(middleWidth + 64.w + 30.w, size.height - 6.w);
    path.quadraticBezierTo(
      middleControlPoint.dx,
      middleControlPoint.dy,
      middleEndPoint.dx,
      middleEndPoint.dy,
    );
    path.lineTo(middleWidth + 64.w + 30.w, size.height - 6.w);
    path.lineTo(middleWidth + 64.w + 30.w + 10.w, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
