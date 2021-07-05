import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/app_colors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class PopularRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/breakfast.png",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(getTranslated(context, "pop_rest")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.orange,
                  size: 25,
                ),
                Text(
                  "4.9 ",
                  style: TextStyle(color: AppColors.orange),
                ),
                Text("(124 ratings)  Cafe"),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 100),
                  child: Text("Western food"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
