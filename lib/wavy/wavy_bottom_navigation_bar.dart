import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/clipper/wavy_bottom_navigation_bar_clipper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WavyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ClipPath(
      child: Container(
        color: Colors.white,
        height: 180.w,
      ),
      clipper: WavyBottomNavigationBarClipper(),
    );
  }
}