import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/utils/app_colors.dart';

class Direction extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Color buttonColor;
  const Direction(
      {Key? key,
      required this.title,
      this.titleColor = AppColors.WHITE,
      this.buttonColor = AppColors.BLUE_PRIMARY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.h),
      padding: EdgeInsets.symmetric(vertical: 1.w, horizontal: 4.h),
      decoration: BoxDecoration(
          color: buttonColor, border: Border.all(color: AppColors.Gray_border)),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: Icon(Icons.keyboard_arrow_up,
                  size: 20.sp, color: titleColor)),
          Text(
            title,
            style: TextStyle(
                color: titleColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
