import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Utilities/app_colors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class DesertsPage extends StatefulWidget {
  @override
  _DesertsPageState createState() => _DesertsPageState();
}

class _DesertsPageState extends State<DesertsPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTranslated(context, "desserts"),
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
      ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 2.0, bottom: 100),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              height: _height * 0.25,
              child: Stack(children: [
                PositionedDirectional(
                    end: 0,
                    start: 0,

                    child: Image.asset(
                      "assets/apple_pie.png",
                    )),
                PositionedDirectional(
                    start: 5,
                    top: 140,
                    child: Column(
                      children: [
                        Text(getTranslated(context, "pop_rest"),
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 5, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 20,
                              ),
                              Text(
                                "4.9 ",
                                style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: "Metropolis",
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                              Text("(124 ratings)",
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontFamily: "Metropolis",
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 5),
                                child: Text("desserts",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontFamily: "Metropolis",
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ]),
            ),
          );
        },
      ),
    ])));
  }
}
