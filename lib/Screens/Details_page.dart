import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Utilities/app_colors.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/tandori_pizza.png",
              height: _height * 0.4,
              width: _width,
              fit: BoxFit.cover,
            ),
            PositionedDirectional(
              end: 25,
              top: 55,
              child: SvgPicture.asset(
                "assets/cart-shopping.svg",
                height: 20,
                color: AppColors.white,
              ),
            ),
            PositionedDirectional(child: Container(

            ))
          ],
        ),
      ),
    );
  }
}
