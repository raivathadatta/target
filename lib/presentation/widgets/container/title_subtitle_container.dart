import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class TitleSubTitleItem extends StatelessWidget {
  final String headTitle;
  final String subtitle;
  const TitleSubTitleItem(
      {required this.headTitle, required this.subtitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headTitle,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            subtitle,
            maxLines: 2,
            style: TextStyle(fontSize: 12.sp, color: AppColors.DARK_GREY),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
