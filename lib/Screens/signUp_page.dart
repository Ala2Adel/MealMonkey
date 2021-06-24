import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_monkey/Screens/login_page.dart';
import 'package:meal_monkey/localization/language_constants.dart';

import '../app_colors.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKeySignUp = GlobalKey<FormState>();

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
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: Text(
                        getTranslated(context, "sign_up"),
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
                        getTranslated(context, "add_details_signUp"),
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
                    key: _formKeySignUp,
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
                                hintText: getTranslated(context, "name"),
                                hintStyle: TextStyle(
                                    color: AppColors.lightGrey.withOpacity(0.7),
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              onTap: () {
                                _nameController.clear();
                              },
                              controller: _nameController,
                              showCursor: true,
                              keyboardType: TextInputType.name,
                              autocorrect: false,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35,vertical: 30),
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
                                hintText: getTranslated(context, "mobile_no"),
                                hintStyle: TextStyle(
                                    color: AppColors.lightGrey.withOpacity(0.7),
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              onTap: () {
                                _mobileController.clear();
                              },
                              controller: _mobileController,
                              showCursor: true,
                              keyboardType: TextInputType.phone,
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35),
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
                                hintText: getTranslated(context, "address"),
                                hintStyle: TextStyle(
                                    color: AppColors.lightGrey.withOpacity(0.7),
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              onTap: () {
                                _addressController.clear();
                              },
                              controller: _addressController,
                              showCursor: true,
                              keyboardType: TextInputType.streetAddress,
                              autocorrect: false,
                            ),
                          ),
                        ),
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35),
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
                                hintText:
                                    getTranslated(context, "confirm_pass"),
                                hintStyle: TextStyle(
                                    color: AppColors.lightGrey.withOpacity(0.7),
                                    fontFamily: "Metropolis",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                              onTap: () {
                                _confirmPasswordController.clear();
                              },
                              controller: _confirmPasswordController,
                              showCursor: true,
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
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
                                getTranslated(context, "sign_up"),
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
                    padding:
                        const EdgeInsetsDirectional.only(start: 90, top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          getTranslated(context, "have_account"),
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
                                builder: (BuildContext context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            getTranslated(context, "login"),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Metropolis",
                                fontWeight: FontWeight.w500,
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
}
