import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/app_colors.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    // getUser();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ),
            ));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Center(
            child: Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
        )),
        PositionedDirectional(
          top: 0.38 * _height,
          start: 0.37 * _width,
          child: SvgPicture.asset(
            "assets/Monkey_face.svg",
            height: _height * 0.14,
            fit: BoxFit.fill,
          ),
        ),
        PositionedDirectional(
            top: 0.53 * _height,
            start: 0.25 * _width,
            child: Text(
              "Meal",
              style: TextStyle(
                  fontFamily: "Cabin", fontSize: 34, color: AppColors.orange),
            )),
        PositionedDirectional(
            top: 0.53 * _height,
            start: 0.45 * _width,
            child: Text(
              "Monkey",
              style: TextStyle(
                  fontFamily: "Cabin", fontSize: 34, color: AppColors.darkGrey),
            )),
        PositionedDirectional(
            top: 0.59 * _height,
            start: 0.38 * _width,
            child: Text(
              "Food delivery".toUpperCase(),
              style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: AppColors.darkGrey),
            )),
      ]),
    );
  }
}
