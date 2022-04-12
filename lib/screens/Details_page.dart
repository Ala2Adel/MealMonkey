import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Utilities/appColors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            child: Image.asset(
              "assets/tandori_pizza.png",
              height: _height * 0.4,
              width: _width,
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            end: 25,
            top: 55,
            child: SvgPicture.asset(
              "assets/cart-shopping.svg",
              height: 20,
              color: AppColors.white,
            ),
          ),
          PositionedDirectional(
              top: 270,
              height: _height,
              width: _width,
              child: Container(
                // height: _height,
                // width: _width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 5,
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(top: 30, start: 25),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tandoori Chicken pizza",
                          style: TextStyle(
                              color: AppColors.darkGrey,
                              fontFamily: "Metropolis",
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 5),
                        RatingBarIndicator(
                            rating: 4,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star_rounded, color: AppColors.orange),
                            unratedColor: AppColors.lightGrey.withOpacity(0.5),
                            itemCount: 5,
                            itemSize: 23,
                            direction: Axis.horizontal),
                        // SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4 " + getTranslated(context, "star_rating"),
                              style: TextStyle(
                                  color: AppColors.orange,
                                  fontFamily: "Metropolis",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 5, end: 20),
                              child: Text(
                                "LE 120",
                                style: TextStyle(
                                    color: AppColors.darkGrey,
                                    fontFamily: "Metropolis",
                                    fontSize: 31,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
