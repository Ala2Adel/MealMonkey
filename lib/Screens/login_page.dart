import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_monkey/Screens/resetPassword_page.dart';
import 'package:meal_monkey/Screens/signUp_page.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarColor: AppColors.transparent));
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: _width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Center(
                      child: Text(
                        getTranslated(context, "login"),
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
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Text(
                        getTranslated(context, "add_details_login"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.darkGrey),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKeyLogin,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 30),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                color: AppColors.lightGrey.withOpacity(0.1)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.only(
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
                              validator: _validateEmail,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                color: AppColors.lightGrey.withOpacity(0.1)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.only(
                                        start: 30, top: 20, bottom: 20),
                                hintText: getTranslated(context, "password"),
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
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              // validator: _validateEmail,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 35),
                          child: Container(
                            width: _width * 0.9,
                            height: _height * 0.075,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                color: AppColors.orange),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                getTranslated(context, "login"),
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => ResetPasswordPage(),
                            ),
                          );
                        },

                        child: Text(
                          getTranslated(context, "forgot_pass"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkGrey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: Text(
                        getTranslated(context, "or_login"),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Metropolis",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.darkGrey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 35),
                    child: Container(
                      width: _width * 0.9,
                      height: _height * 0.075,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          color: AppColors.facebook),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            "assets/facebook-logo.svg",
                            height: _height * 0.025,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            getTranslated(context, "login_facebook"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 35),
                    child: Container(
                      width: _width * 0.9,
                      height: _height * 0.075,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(28)),
                          color: AppColors.googlePlus),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            "assets/google-plus-logo.svg",
                            height: _height * 0.02,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            getTranslated(context, "login_google"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 90, top: 70),
                    child: Row(
                      children: [
                        Text(
                          getTranslated(context, "no_account"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Metropolis",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.darkGrey),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignUpPage(),
                              ),
                            );
                          },
                          child: Text(
                            getTranslated(context, "sign_up"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.orange),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  String _validateEmail(String value) {
    if (value == null || value == '') {
      return 'Email is required';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter valid email address';
    }
    return null;
  }
}
