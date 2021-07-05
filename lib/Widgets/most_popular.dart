import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/app_colors.dart';
import 'package:meal_monkey/localization/language_constants.dart';

class MostPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "assets/breakfast3.png",
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(getTranslated(context, "most_pop")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Cafe",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Western food",
                  style: TextStyle(fontSize: 12),
                ),
                Icon(
                  Icons.star,
                  color: AppColors.orange,
                  size: 15,
                ),
                Text(
                  "4.9 ",
                  style: TextStyle(color: AppColors.orange, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
