import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/images_loation.dart';

class DateOverflowHeader extends StatefulWidget {
  const DateOverflowHeader({Key? key}) : super(key: key);

  @override
  _DateOverflowHeaderState createState() => _DateOverflowHeaderState();
}

class _DateOverflowHeaderState extends State<DateOverflowHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(color: AppColors.OFF_WHITE),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15.w,
              ),
              InkWell(
                onTap: () {},
                child: Center(
                  child: Image.asset(
                    ImageLocations.back_rounded_button,
                    width: 24.h,
                    height: 24.h,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      ImageLocations.back_rounded_button,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageLocations.date_range,
                      width: 18.h,
                      height: 18.h,
                    ),
                    Text(
                      "\t MAY 2021",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
