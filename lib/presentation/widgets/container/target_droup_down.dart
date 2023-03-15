import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapDropDown extends StatelessWidget {
  final String title;
  final Color titleColor;
  final bool showIcon;
  const MapDropDown(
      {Key? key,
      required this.title,
      this.titleColor = const Color.fromRGBO(0, 0, 0, 0.54),
      this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.w, horizontal: 3.h),
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 6.h),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(207, 207, 207, 1))),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: titleColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w800),
          ),
          Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: showIcon
                  ? Icon(Icons.keyboard_arrow_down_rounded,
                      size: 20.sp, color: Color.fromRGBO(0, 0, 0, 0.54))
                  : SizedBox()),
        ],
      ),
    );
  }
}
