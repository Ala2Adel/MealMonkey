import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/Widgets/restaurants_card.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLocation;

  var _locations = ['Cairo', 'Alexandria', 'Giza'];
  List _images = [
    "assets/offers.png",
    "assets/pizza.png",
    "assets/western.png",
    "assets/sri_lanka.png",
    "assets/indian.png"
  ];
  List _labels = ["Offers", "Italian", "Western", "Sri Lankan", "Indian"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Good Morning" + " Alaa!",
                    style: TextStyle(
                        fontSize: 20.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, "delivery_to"),
                      style: TextStyle(
                          fontSize: 11.0,
                          color: AppColors.grey,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  DropdownButton(
                    hint: Text(
                      getTranslated(context, "current_loc"),
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.lightGrey,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w600),
                    ),
                    isDense: true,
                    underline: SizedBox(),
                    icon: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 25.0),
                      child: SvgPicture.asset(
                        "assets/menu_down.svg",
                        color: AppColors.orange,
                      ),
                    ),
                    iconSize: 30.0,
                    style: TextStyle(color: AppColors.darkGrey),
                    items: _locations.map(
                      (String val) {
                        return DropdownMenuItem<String>(
                          child: Text(
                            val,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.lightGrey,
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w600),
                          ),
                          value: val,
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          print("$val");
                          _selectedLocation = val;
                        },
                      );
                    },
                    value: _selectedLocation,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
                  height: _height * 0.15,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: 12, top: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    _images[index],
                                    height: 80,
                                    width: _width * 0.26,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 7.0),
                                      child: Center(
                                        child: Text(_labels[index],
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: AppColors.darkGrey,
                                                fontFamily: "Metropolis",
                                                fontWeight: FontWeight.bold)),
                                      )))
                            ],
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getTranslated(context, "pop_rest"),
                      style: TextStyle(
                          fontSize: 20.0,
                          color: AppColors.darkGrey,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      getTranslated(context, "view_all"),
                      style: TextStyle(
                          fontSize: 13.0,
                          color: AppColors.orange,
                          fontFamily: "Metropolis",
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Container(
                height: _height*0.4,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return RestaurantsCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
