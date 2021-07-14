import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Utilities/app_colors.dart';

class MenuItems extends StatefulWidget {
  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  List _menuNames = [
    "Food",
    "Beverages",
    "Desserts",
    "Promotions",
  ];
  List _menuCount = ["120 items", "220 items", "155 items", "25 items"];

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(
      height: _height*0.15,
      child: Stack(
        children: [
          PositionedDirectional(
            start: 50,
             // top: 30,
            //end: 25,
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grey.withOpacity(0.3),
                        spreadRadius: 8,
                        blurRadius: 10,
                        // offset: Offset(0, 20), // changes position of shadow
                      ),
                    ],
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(38),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(38),
                        bottomRight: Radius.circular(15))),
                width: _width * 0.8,
                height: _height * 0.11,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Food",
                          style: TextStyle(
                              fontFamily: "Cabin",
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: AppColors.darkGrey)),
                      Text("120 items",
                          style: TextStyle(
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                              color: AppColors.lightGrey))
                    ],
                  ),
                )),
          ),
          PositionedDirectional(
              top: 10,
              start: 20,
              child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/western.png"),
                  backgroundColor: AppColors.lightGrey,
                  radius: 35,
                ),
              )),
          PositionedDirectional(
             top: 25,
              end: 15,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  child: SvgPicture.asset("assets/next_icon.svg"),
                  backgroundColor: AppColors.white,
                  radius: 15,
                ),
              )),
        ],
      ),
    );
  }
}
