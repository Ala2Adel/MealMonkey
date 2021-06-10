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
        height: _height * 0.59,
        child: SvgPicture.asset(
          'assets/Orange_top_shape.svg',
          fit: BoxFit.cover,
        ),
      ),
      PositionedDirectional(
        top: 0.4 * _height,
        start: 0.4 * _width,
        child: SvgPicture.asset(
          "assets/Monkey_face.svg",
          height: _height * 0.13,
          fit: BoxFit.fill,
        ),
      ),
      PositionedDirectional(
          top: 0.55 * _height,
          start: 0.25 * _width,
          child: Text(
            "Meal",
            style: TextStyle(
                fontFamily: "Cabin", fontSize: 34, color: AppColors.orange),
          )),
      PositionedDirectional(
          top: 0.55 * _height,
          start: 0.45 * _width,
          child: Text(
            "Monkey",
            style: TextStyle(
                fontFamily: "Cabin", fontSize: 34, color: AppColors.darkGrey),
          )),
      PositionedDirectional(
          top: 0.61 * _height,
          start: 0.4 * _width,
          child: Text(
            "Food delivery".toUpperCase(),
            style: TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.darkGrey),
          )),
      PositionedDirectional(
          top: 0.68 * _height,
          start: 0.1 * _width,
          child: Text(
            getTranslated(context, "discover"),
            style: TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColors.darkGrey),
          )),
      PositionedDirectional(
        top: 0.75 * _height,
        start: 0.4 * _width,
        child: Container(
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(28)), color: AppColors.orange),
          child: Text(
            getTranslated(context, "login"),
            style: TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.white),
          ),
        ),
      )
    ]));
  }
}
