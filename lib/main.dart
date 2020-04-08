import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double heightScreen = mediaQueryData.size.height;
    double paddingTop = mediaQueryData.padding.top;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            _buildWidgetContent(heightScreen),
            Container(
              color: Colors.black.withOpacity(0.1),
              width: double.infinity,
              height: paddingTop + 36,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetContent(double heightScreen) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 570.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/img_polar_light.jpg',
                      fit: BoxFit.cover,
                      height: heightScreen / 2,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      height: heightScreen / 2,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 380),
                child: WavyImage('assets/images/img_dessert.jpg'),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(top: 190.0),
                child: WavyImage('assets/images/img_polar_light.jpg'),
              ),
            ),
            Positioned(
              child: WavyImage('assets/images/img_dessert.jpg'),
            ),
          ],
        ),
      ],
    );
  }
}

class WavyImage extends StatelessWidget {
  final String img;

  WavyImage(this.img);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double heightScreen = mediaQueryData.size.height;
    return ClipPath(
      child: Stack(
        children: <Widget>[
          Image.asset(
            img,
            fit: BoxFit.cover,
            height: heightScreen / 2,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            height: heightScreen / 2,
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
    /*path.lineTo(0, size.height - 20);

    double dxFirstControlPoint = size.width / 4;
    double dyFirstControlPoint = size.height;
    double dxFirstEndPoint = size.width / 2.25;
    double dyFirstEndpoint = size.height - 30;
    print('FirstControlPoint dx: $dxFirstControlPoint & dy: $dyFirstControlPoint');
    print('FirstEndPoint dx: $dxFirstEndPoint & dy: $dyFirstEndpoint');
    var firstControlPoint = Offset(dxFirstControlPoint, dyFirstControlPoint);
    var firstEndPoint = Offset(dxFirstEndPoint, dyFirstEndpoint);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    double dxSecondControlPoint = size.width - (size.width / 3.25);
    double dySecondControlPoint = size.height - 65;
    double dxSecondEndPoint = size.width;
    double dySecondEndPoint = size.height - 40;
    print('SecondControlPoint dx: $dxSecondControlPoint & dy: $dySecondControlPoint');
    print('SecondEndPoint dx: $dxSecondEndPoint & dy: $dySecondEndPoint');
    var secondControlPoint = Offset(dxSecondControlPoint, dySecondControlPoint);
    var secondEndPoint = Offset(dxSecondEndPoint, dySecondEndPoint);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);*/

    // benar
    path.lineTo(0, size.height - 140);
    var firstControlPoint = Offset(0, size.height - 100);
    var firstEndPoint = Offset(30, size.height - 90);
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
    // benar

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
