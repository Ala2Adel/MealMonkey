import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      PositionedDirectional(
        width: _width,
        height: _height * 0.53,
        child: SvgPicture.asset(
          'assets/Shaped_subtraction.svg',
          fit: BoxFit.cover,
        ),
      ),
//      PositionedDirectional(
//        width: _width,
//        height: _height * 0.59,
//        child: SvgPicture.asset(
//          'assets/Background_objects.svg',
//          fit: BoxFit.cover,
//        ),
//      ),
      PositionedDirectional(
        top: 0.42 * _height,
        start: 0.4 * _width,
        child: SvgPicture.asset(
          "assets/Monkey_face.svg",
          height: _height * 0.13,
          fit: BoxFit.fill,
        ),
      ),
      PositionedDirectional(
          top: 0.57 * _height,
          start: 0.25 * _width,
          child: Text(
            "Meal",
            style: TextStyle(
                fontFamily: "Cabin", fontSize: 34, color: AppColors.orange),
          )),
      PositionedDirectional(
          top: 0.57 * _height,
          start: 0.45 * _width,
          child: Text(
            "Monkey",
            style: TextStyle(
                fontFamily: "Cabin", fontSize: 34, color: AppColors.darkGrey),
          )),
      PositionedDirectional(
          top: 0.64 * _height,
          start: 0.38 * _width,
          child: Text(
            "Food delivery".toUpperCase(),
            style: TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.darkGrey),
          )),
      PositionedDirectional(
          top: 0.7 * _height,
          start: 0.1 * _width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              getTranslated(context, "discover"),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppColors.darkGrey),
            ),
          )),
      PositionedDirectional(
        top: 0.79 * _height,
        start: 0.1 * _width,
        child: Container(
          width: _width * 0.8,
          height: _height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              color: AppColors.orange),
          child: Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Text(
              getTranslated(context, "login"),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.white),
            ),
          ),
        ),
      )
    ]));
  }
}
