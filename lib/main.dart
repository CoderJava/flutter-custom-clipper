import 'dart:ui';

import 'package:flutter/material.dart';
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
    double paddingTop = mediaQueryData.padding.top;
    double paddingBottom = mediaQueryData.padding.bottom;
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
          ],
        ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildWidgetTitle('Calm'),
                _buildWidgetSubtitle('Slow down and relax'),
              ],
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

class WavyImage extends StatelessWidget {
  final String img;

  WavyImage(this.img);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Stack(
        children: <Widget>[
          Image.asset(
            img,
            fit: BoxFit.cover,
            height: 1150.w,
          ),
          ContainerBlack(
            heightScreen: 1150.w,
          ),
        ],
      ),
      clipper: WaveClipper(),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
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

    path.lineTo(size.width, 200);
    var thirdControlPoint = Offset(size.width, 140);
    var thirdEndPoint = Offset(size.width - 30, 150);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdControlPoint.dy,
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

class ContainerBlack extends StatelessWidget {
  const ContainerBlack({
    Key key,
    @required this.heightScreen,
  }) : super(key: key);

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScreen,
      color: Colors.black.withOpacity(0.5),
    );
  }
}
