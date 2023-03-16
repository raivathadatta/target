/*
 * Copyright © 2022, This code is developed by Parmeet Singh,
 *  Under work enviorment of Spice money.Sharing and distributor source code outside organisaton is prohibited.
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spice_tracker/core/images_location.dart';
import 'package:spice_tracker/core/app_colors.dart';

class ColorGtvListItem extends StatelessWidget {
  final Color color;

  final String text;

  final bool enableStar;

  const ColorGtvListItem(
      {Key? key,
      required this.text,
      required this.color,
      required this.enableStar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final boxHeight = 50.h;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          padding:
              EdgeInsets.only(left: 7.w, right: 8.w, top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
            color: color,
          ),
          child: Text(
            text,
            style: TextStyle(
                color: AppColors.WHITE,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
          ),
        ),
        if (enableStar)
          Positioned.fill(
              top: 0,
              left: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.star,
                  size: 18,
                  color: AppColors.GOLDEN,
                ),
              )),
      ],
    );
  }
}
