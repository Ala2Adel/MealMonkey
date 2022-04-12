import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:meal_monkey/Screens/bottomNav.dart';
import 'package:meal_monkey/Utilities/appColors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 230]) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: AppColors.transparent));

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    List<PageViewModel> _allPages = <PageViewModel>[
      PageViewModel(
        title: getTranslated(context, "find_food"),
        body: getTranslated(context, "discover"),
        image: _buildImage('find_food.svg'),
      ),
      PageViewModel(
        title: getTranslated(context, "fast_delivery"),
        body: getTranslated(context, "fast_food"),
        image: _buildImage('Delivery.svg'),
      ),
      PageViewModel(
        title: getTranslated(context, "live_tracking"),
        body: getTranslated(context, "real_time_track"),
        image: _buildImage('live_tracking.svg', 200),
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: _allPages.length,
            allowImplicitScrolling: true,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: _allPages[index].image,
                  ),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: _allPages.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            width: currentIndex == index ? 10 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? AppColors.orange
                                  : AppColors.lightGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ),
                  Text(
                    _allPages[index].title,
                    style: TextStyle(
                        fontSize: 28.0,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Metropolis"),
                  ),
                  Text(
                    _allPages[index].body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.3,
                        fontSize: 13.0,
                        color: AppColors.darkGrey,
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () async {
                      print(index);
                      if (index == _allPages.length - 1) {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => BottomNav()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                        child: Container(
                            width: _width * 0.92,
                            height: _height * 0.075,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(28)),
                                color: AppColors.orange),
                            child: Center(
                              child: Text(
                                getTranslated(context, "next"),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white),
                              ),
                            ))),
                  )
                ],
              );
            }),
      ),
    );
  }
}
