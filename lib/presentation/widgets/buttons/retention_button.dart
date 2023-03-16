import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/core/images_location.dart';
import 'package:spice_tracker/core/app_colors.dart';

class RetentionButton extends StatelessWidget {
  final Function() callBack;
  RetentionButton({Key? key, required this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.main_blue,
      label: Row(
        children: [
          Icon(
            Icons.calendar_today_sharp,
            color: AppColors.WHITE,
          ),
          SizedBox(
            width: 3.w,
          ),
          Text(
            "Start My Day",
            style: TextStyle(
              color: AppColors.WHITE,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
      onPressed: callBack,

      // child: Container(
      //   padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      //   decoration: BoxDecoration(
      //       color: AppColors.main_blue,
      //       borderRadius: BorderRadius.circular(5.sp)),
      //   child:
      // ),
    );
  }
}
