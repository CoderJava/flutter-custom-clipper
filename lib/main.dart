import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meditation_app/wavy/wavy_bottom_navigation_bar.dart';
import 'package:flutter_meditation_app/wavy/wavy_image.dart';
import 'package:flutter_meditation_app/widgets/container_black.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double heightScreen = mediaQueryData.size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/img_scenic_mountain.jpg',
                        fit: BoxFit.cover,
                        height: heightScreen / 2,
                      ),
                      ContainerBlack(heightScreen: heightScreen),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/img_water_drop.jpg',
                        fit: BoxFit.cover,
                        height: heightScreen / 2,
                      ),
                      ContainerBlack(heightScreen: heightScreen),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: WavyImage(
                'assets/images/img_peaceful_piano.jpg',
              ),
            ),
            _buildWidgetColumnText(),
            Align(
              alignment: Alignment.bottomCenter,
              child: WavyBottomNavigationBar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.w + ScreenUtil.bottomBarHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildWidgetCircleMenu(Icons.bubble_chart, false),
                    _buildWidgetCircleMenu(Icons.accessibility_new, true),
                    _buildWidgetCircleMenu(Icons.brightness_3, false),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenUtil.bottomBarHeight > 0 ? ScreenUtil.bottomBarHeight : 24.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _buildWidgetTextMenuCircle('Focus', false),
                    _buildWidgetTextMenuCircle('Relax', true),
                    _buildWidgetTextMenuCircle('Sleep', false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetTextMenuCircle(String text, bool isActive) {
    return Text(
      text,
      style: TextStyle(
        color: isActive ? Colors.white : Colors.grey[800],
      ),
    );
  }

  Widget _buildWidgetCircleMenu(IconData iconData, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: isActive
            ? Border.all(
                color: Colors.grey[800],
                width: 2,
              )
            : null,
      ),
      width: 150.w,
      height: 150.w,
      child: Icon(
        iconData,
        color: isActive ? Colors.grey[900] : Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _buildWidgetColumnText() {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildWidgetTitle('Meditation'),
                _buildWidgetSubtitle('Breathe, Sense, Feel'),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildWidgetTitle('Piano'),
                _buildWidgetSubtitle('Relax and indulge'),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildWidgetTitle('Calm'),
                  _buildWidgetSubtitle('Slow down and relax'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'MazzardSemiBold',
        fontSize: ScreenUtil().setSp(128),
      ),
    );
  }

  Widget _buildWidgetSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontFamily: 'MazzardSemiBold',
        fontSize: ScreenUtil().setSp(42),
        height: ScreenUtil().setHeight(1),
      ),
    );
  }
}
