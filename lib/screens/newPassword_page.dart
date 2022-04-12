import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_monkey/Screens/onBoardingScreen.dart';
import 'package:meal_monkey/localization/language_constants.dart';
import 'package:meal_monkey/Utilities/appColors.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery
        .of(context)
        .size
        .height;
    var _width = MediaQuery
        .of(context)
        .size
        .width;

    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Text(
                    getTranslated(context, "new_pass"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: AppColors.darkGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 20),
                child: Center(
                  child: Text(
                    getTranslated(context, "enter_email"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Metropolis",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: AppColors.darkGrey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35, vertical: 35),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      color: AppColors.lightGrey.withOpacity(0.1)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsetsDirectional.only(
                          start: 30, top: 20, bottom: 20),
                      hintText: getTranslated(context, "new_pass"),
                      hintStyle: TextStyle(
                          color: AppColors.lightGrey.withOpacity(0.7),
                          fontFamily: "Metropolis",
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      _passwordController.clear();
                    },

                    controller: _passwordController,
                    showCursor: true,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    // validator: _validateEmail,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35,),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(28)),
                      color: AppColors.lightGrey.withOpacity(0.1)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsetsDirectional.only(
                          start: 30, top: 20, bottom: 20),
                      hintText: getTranslated(context, "confirm_pass"),
                      hintStyle: TextStyle(
                          color: AppColors.lightGrey.withOpacity(0.7),
                          fontFamily: "Metropolis",
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      _passwordController.clear();
                    },

                    controller: _passwordController,
                    showCursor: true,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    // validator: _validateEmail,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => OnBoardingPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: _width * 0.9,
                    height: _height * 0.075,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                        color: AppColors.orange),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        getTranslated(context, "next"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ]));
  }
}
