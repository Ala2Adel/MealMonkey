import 'package:flutter/material.dart';
import 'package:meal_monkey/database/connectWithSharedPref.dart';
import 'package:meal_monkey/database/shared_preferences.dart';

import 'localization.dart';


Future<Locale> setLocale(String languageCode) async {
  SharedPref sharedPref = SharedPref();
  await sharedPref.save(ConnectWithSharedPref.languageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPref sharedPref = SharedPref();
  String languageCode;
  try {
    languageCode =
        await sharedPref.read(ConnectWithSharedPref.languageCode) ?? 'en';
  } catch (err) {
    languageCode = 'en';
  }
  print("------------ languageCode = $languageCode ---------------");
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  const String ENGLISH = 'en';
  const String ARABIC = 'ar';
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case ARABIC:
      return Locale(ARABIC, "SA");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return Localization.of(context).translate(key);
}
