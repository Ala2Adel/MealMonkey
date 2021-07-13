import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/Screens/home_page.dart';
import 'package:meal_monkey/Screens/menu_page.dart';
import 'package:meal_monkey/Screens/resetPassword_page.dart';
import 'package:meal_monkey/Screens/signUp_page.dart';
import 'package:meal_monkey/Screens/welcome_page.dart';
import 'package:meal_monkey/localization/language_constants.dart';
import '../app_colors.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: currentTab == 0 ? AppColors.orange : AppColors.grey,
          elevation: 10,
          child: Icon(
            Icons.home_rounded,
            size: 45,
          ),
          onPressed: () {
            setState(() {
              currentScreen =
                  HomePage(); // if user taps on this dashboard tab will be active
              currentTab = 0;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.3),
              spreadRadius: 15,
              blurRadius: 15,
              // offset: Offset(0, 20), // changes position of shadow
            ),
          ],
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 15,
          child: Container(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              MenuPage(); // if user taps on this dashboard tab will be active
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.dashboard,
                            color: currentTab == 1
                                ? AppColors.orange
                                : AppColors.grey,
                          ),
                          Text(
                            getTranslated(context, "menu"),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Metropolis",
                              // fontWeight: FontWeight.w400,
                              color: currentTab == 1
                                  ? AppColors.orange
                                  : AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              ResetPasswordPage(); // if user taps on this dashboard tab will be active
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: SvgPicture.asset(
                            "assets/offers.svg",
                            height: 20,
                            width: 20,
                            color: currentTab == 2
                                ? AppColors.orange
                                : AppColors.grey,
                          )),
                          Text(
                            getTranslated(context, "offers"),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w400,
                              color: currentTab == 2
                                  ? AppColors.orange
                                  : AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              WelcomePage(); // if user taps on this dashboard tab will be active
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: SvgPicture.asset(
                            "assets/profile.svg",
                            height: 20,
                            width: 20,
                            color: currentTab == 3
                                ? AppColors.orange
                                : AppColors.grey,
                          )),
                          Text(
                            getTranslated(context, "profile"),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w400,
                              color: currentTab == 3
                                  ? AppColors.orange
                                  : AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen =
                              WelcomePage(); // if user taps on this dashboard tab will be active
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              child: SvgPicture.asset(
                            "assets/more.svg",
                            height: 20,
                            width: 20,
                            color: currentTab == 4
                                ? AppColors.orange
                                : AppColors.grey,
                          )),
                          Text(
                            getTranslated(context, "more"),
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Metropolis",
                              color: currentTab == 4
                                  ? AppColors.orange
                                  : AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
