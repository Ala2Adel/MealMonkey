import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Utilities/app_colors.dart';
import 'package:meal_monkey/Widgets/pop_restaurants.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTranslated(context, "latest_offers"),
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
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Text(
          getTranslated(context, "find_discounts"),
          style: TextStyle(
              fontFamily: "Metropolis",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.4,
              color: AppColors.darkGrey),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => OnBoardingPage(),
            //   ),
            // );
          },
          child: Container(
            width: _width * 0.35,
            height: _height * 0.04,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                color: AppColors.orange),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                getTranslated(context, "check_offers"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Metropolis",
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                    color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 5.0, start: 10, end: 10, bottom: 50),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 0.0),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return PopularRestaurants();
          },
        ),
      ),
    ])));
  }
}
