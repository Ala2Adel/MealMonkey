import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_monkey/Screens/newPassword_page.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    TextEditingController _emailController = TextEditingController();

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Center(
          child: Text(
            getTranslated(context, "reset_pass"),
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
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
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
              hintText: getTranslated(context, "email"),
              hintStyle: TextStyle(
                  color: AppColors.lightGrey.withOpacity(0.7),
                  fontFamily: "Metropolis",
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
            onTap: () {
              _emailController.clear();
            },

            controller: _emailController,
            showCursor: true,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            // validator: _validateEmail,
          ),
        ),
          ),
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => NewPasswordPage(),
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
                getTranslated(context, "send"),
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
