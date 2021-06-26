import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:meal_monkey/app_colors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 260]) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));

    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    const bodyStyle = TextStyle(
        fontSize: 13.0, fontFamily: "Metropolis", fontWeight: FontWeight.w400);

    var pageDecoration = PageDecoration(
        titlePadding: EdgeInsets.only(top: 100),
        titleTextStyle: TextStyle(
            fontSize: 28.0,
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w700,
            fontFamily: "Metropolis"),
        bodyTextStyle: bodyStyle,
        descriptionPadding:
            EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.only(top: 50),
        imageFlex: 1);

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalFooter: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Container(
            width: _width * 0.9,
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
            )),
      ),
      pages: [
        PageViewModel(
          title: getTranslated(context, "find_food"),
          body: getTranslated(context, "discover"),
          image: _buildImage('find_food.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: getTranslated(context, "fast_delivery"),
          body: getTranslated(context, "fast_food"),
          image: _buildImage('Delivery.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: getTranslated(context, "live_tracking"),
          body: getTranslated(context, "real_time_track"),
          image: _buildImage('live_tracking.svg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {},
      next: Text(""),
      done: Text(""),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(bottom: 150),
      dotsDecorator: const DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeSize: Size(20.0, 10.0),
        activeColor: Color(0xFFFc6011),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
