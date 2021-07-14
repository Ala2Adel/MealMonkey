import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Screens/login_page.dart';
import 'package:meal_monkey/Screens/signUp_page.dart';
import 'package:meal_monkey/localization/language_constants.dart';
import '../Utilities/app_colors.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      PositionedDirectional(
        width: _width,
        height: _height * 0.5,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGrey.withOpacity(0.4),
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/Shaped_subtraction.svg',
            fit: BoxFit.fill,
          ),
        ),
      ),
      PositionedDirectional(
        width: _width,
        height: _height * 0.5,
        child: SvgPicture.asset(
          'assets/Background_objects.svg',
          fit: BoxFit.fill,
        ),
      ),
      PositionedDirectional(
        top: 0.4 * _height,
        start: 0.36 * _width,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.elliptical(80, 80),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white.withOpacity(0.7),
                spreadRadius: 25,
                blurRadius: 25,
                offset: Offset(0, 20), // changes position of shadow
              ),
            ],
          ),
          child: SvgPicture.asset(
            "assets/Monkey_face.svg",
            height: _height * 0.14,
            fit: BoxFit.fill,
          ),
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
          top: 0.62 * _height,
          start: 0.37 * _width,
          child: Text(
            "Food delivery".toUpperCase(),
            style: TextStyle(
                fontFamily: "Metropolis",
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.darkGrey),
          )),
      PositionedDirectional(
          top: 0.67 * _height,
          start: 0.1 * _width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
            child: Text(
              getTranslated(context, "discover"),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Metropolis",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  height: 1.3,
                  color: AppColors.darkGrey),
            ),
          )),
      PositionedDirectional(
        top: 0.79 * _height,
        start: 0.1 * _width,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
            );
          },
          child: Container(
            width: _width * 0.8,
            height: _height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                color: AppColors.orange),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
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
        ),
      ),
      PositionedDirectional(
        top: 0.88 * _height,
        start: 0.1 * _width,
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SignUpPage(),
              ),
            );
          },
          child: Container(
            width: _width * 0.8,
            height: _height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                border: Border.all(color: AppColors.orange),
                color: AppColors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                getTranslated(context, "create_account"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.orange),
              ),
            ),
          ),
        ),
      )
    ]));
  }
}
