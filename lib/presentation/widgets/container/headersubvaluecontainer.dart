import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class HeaderSubValueContainer extends StatefulWidget {
  final String title;
  final String type;
  final String subvalue;

  HeaderSubValueContainer(
      {Key? key, required this.title, this.subvalue = "", this.type = ""})
      : super(key: key);

  @override
  _HeaderSubValueContainerState createState() =>
      _HeaderSubValueContainerState();
}

class _HeaderSubValueContainerState extends State<HeaderSubValueContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 5.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Text(
              "${widget.title}",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              "${widget.subvalue}${widget.type == "percentage" ? "%" : ""}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style:
                  TextStyle(fontSize: 11.sp, color: AppColors.BLACK_LIGHT_FONT),
            )
          ],
        ),
      ),
    );
  }
}
