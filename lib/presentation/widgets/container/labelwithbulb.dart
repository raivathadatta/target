import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/core/images_location.dart';
import 'package:spice_tracker/core/app_colors.dart';

class LabelWithBulb extends StatefulWidget {
  var isChurned;
  final String heading;
  final String label;
  var image;

  LabelWithBulb(
      {Key? key,
      this.isChurned = false,
      this.image,
      required this.label,
      required this.heading})
      : super(key: key);

  @override
  _LabelWithBulbState createState() => _LabelWithBulbState();
}

class _LabelWithBulbState extends State<LabelWithBulb> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: widget.isChurned == false
                ? AppColors.OFF_WHITE
                : AppColors.GLOW_RED,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image ?? ImageLocations.bulb,
              height: 20.h,
              width: 16.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: Text.rich(
                TextSpan(
                  text: "${widget.heading}: ",
                  children: [
                    TextSpan(
                      text: "${widget.label}",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: widget.isChurned == false
                        ? AppColors.BLACK_NOTIFICATION
                        : AppColors.RED,
                    fontSize: 11.sp),
              ),
            )
          ],
        ));
  }
}
