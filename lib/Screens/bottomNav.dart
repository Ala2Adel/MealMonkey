import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/Screens/home_page.dart';
import 'package:meal_monkey/Screens/menu_page.dart';
import 'package:meal_monkey/Screens/resetPassword_page.dart';
import 'package:meal_monkey/Screens/welcome_page.dart';
import 'package:meal_monkey/Widgets/custom_Navigator.dart';
import 'package:meal_monkey/localization/language_constants.dart';
import '../Utilities/app_colors.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _children = [
    MenuPage(),
    WelcomePage(),
    HomePage(),
    ResetPasswordPage(),
    WelcomePage()
  ];

  GlobalKey<NavigatorState> customScaffoldKey = GlobalKey();
  int _currentIndex = 2; // to keep track of active tab index
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomNavigator(
          navigatorKey: customScaffoldKey,
          pageRoute: PageRoutes.materialPageRoute,
          home: Builder(
            builder: (context) {
              return _children[_currentIndex];
            },
          )),

      // bottomNavigationBar: BottomAppBar(
      //   notchMargin: 15,
      //   color: AppColors.white,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: 60,
      //   ),
      // ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor:
              _currentIndex == 2 ? AppColors.orange : AppColors.grey,
          elevation: 10,
          child: Icon(
            Icons.home_rounded,
            size: 50,
          ),
          onPressed: () {
            setState(() {
              // if user taps on this dashboard tab will be active
              _currentIndex = 2;
            });
          },
        ),
      ),

      bottomSheet: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: AppColors.grey,
        showSelectedLabels: true,
        selectedItemColor: AppColors.orange,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 22,
              color: _currentIndex == 0 ? AppColors.orange : AppColors.grey,
            ),
            label: getTranslated(context, 'menu'),
          ),
          BottomNavigationBarItem(
            label: getTranslated(context, 'offers'),
            icon: Stack(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/offers.svg",
                  height: 22,
                  color: _currentIndex == 1 ? AppColors.orange : AppColors.grey,
                ),
              ],
            ),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home.svg",
                height: 20,
                color:  _currentIndex == 2 ? AppColors.orange : AppColors.grey,

              ),
              label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/profile.svg",
              height: 22,
              color: _currentIndex == 3 ? AppColors.orange : AppColors.grey,
            ),
            label: getTranslated(context, 'profile'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/more.svg",
              height: 22,
              color: _currentIndex == 4 ? AppColors.orange : AppColors.grey,
            ),
            label: getTranslated(context, 'more'),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    customScaffoldKey.currentState.maybePop();
    setState(() {
      _currentIndex = index;
      print("selectedIndex is $_currentIndex");
    });
  }
}
