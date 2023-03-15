import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/images_loation.dart';

//////
Dialog ShowDialogAreYouShure() {
  return Dialog(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      decoration: BoxDecoration(
          color: AppColors.WHITE, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageLocations.map_icon,
            width: 64.w,
            height: 55.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Are You sure?",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            "Dear requestor, are you sure you\n   want to submit interaction?",
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.BLUE_PRIMARY),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  "No",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.BLUE_PRIMARY,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.BLUE_PRIMARY,
                  border: Border.all(color: AppColors.BLUE_PRIMARY),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Text(
                  "yes",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: AppColors.WHITE,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
