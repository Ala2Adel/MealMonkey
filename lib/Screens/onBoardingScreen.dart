import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:meal_monkey/app_colors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import 'home_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 220]) {
    return SvgPicture.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    const bodyStyle = TextStyle(
        fontSize: 13.0, fontFamily: "Metropolis", fontWeight: FontWeight.w400);

    var pageDecoration =  PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          color: AppColors.darkGrey,
          fontWeight: FontWeight.w700,
          fontFamily: "Metropolis"),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

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
          body:
          getTranslated(context, "fast_food"),
          image: _buildImage('Delivery.svg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
              "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('img3.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
