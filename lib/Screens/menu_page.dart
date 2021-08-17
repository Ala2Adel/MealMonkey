import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Screens/DesertsPage.dart';
import 'package:meal_monkey/Widgets/menu_items.dart';
import 'package:meal_monkey/localization/language_constants.dart';
import '../Utilities/app_colors.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            height: _height * 0.85,
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => DesertsPage(),
                    ),
                  );
                },
                child: MenuItems())),

        // Container(
        //   height: _height * 0.8,
        //   child: Stack(children: [
        //     PositionedDirectional(
        //         start: 0,
        //         top: 15,
        //         child: Container(
        //           decoration: BoxDecoration(
        //               color: AppColors.orange,
        //               borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(38),
        //                   bottomRight: Radius.circular(38))),
        //           width: _width * 0.28,
        //           height: _height * 0.65,
        //         )),
        //   ]),
        // )
      ],
    )));
  }
}
