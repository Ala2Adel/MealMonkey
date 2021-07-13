import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getTranslated(context, "menu"),
                style: TextStyle(
                    fontSize: 24.0,
                    color: AppColors.darkGrey,
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w900),
              ),
              SvgPicture.asset(
                "assets/cart-shopping.svg",
                height: 20,
                color: AppColors.darkGrey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Container(
            height: _height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                color: AppColors.grey.withOpacity(0.25)),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/search.svg",
                    height: 20,
                    color: AppColors.lightGrey,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20),
                    child: Text(
                      getTranslated(context, "search"),
                      style: TextStyle(
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: AppColors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: _height * 0.6,
          child: Stack(
            children: [
              PositionedDirectional(
                  start: 0,
                  top: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(38),
                            bottomRight: Radius.circular(38))),
                    width: _width * 0.27,
                    height: _height * 0.57,
                  )),
              PositionedDirectional(
                  start: 30,
                  top: 30,
                  end: 10,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(38),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(38),
                              bottomRight: Radius.circular(20))),
                      width: _width * 0.06,
                      height: _height * 0.12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Food",
                              style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22,
                                  color: AppColors.darkGrey)),
                          Text("120 items",
                              style: TextStyle(
                                  fontFamily: "Metropolis",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11,
                                  color: AppColors.lightGrey))
                        ],
                      )
                      //CircleAvatar(backgroundColor: AppColors.lightGrey, radius: 15,),
                      ))
            ],
          ),
        )
      ],
    )));
  }
}
