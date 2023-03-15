import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class PercentageRounded extends StatefulWidget {
  var percent;
  bool? percentGreen = false;

  PercentageRounded({Key? key, this.percent, this.percentGreen})
      : super(key: key);

  @override
  _PercentageRoundedState createState() => _PercentageRoundedState();
}

class _PercentageRoundedState extends State<PercentageRounded> {
  bool isgreen = false;

  @override
  Widget build(BuildContext context) {
    if (widget.percentGreen == null) {
      if (widget.percent >= 0) {
        isgreen = true;
      } else {
        isgreen = false;
      }
    } else {
      if (widget.percentGreen == true) {
        isgreen = true;
      } else {
        isgreen = false;
      }
    }

    return isgreen
        ? Container(
            height: 27,
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_upward,
                  color: AppColors.GLOW_GREEN,
                  size: 15,
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  "${widget.percent}%",
                  style: TextStyle(color: AppColors.GLOW_GREEN),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.GREEN_WHITE,
              borderRadius: BorderRadius.circular(20),
            ),
          )
        : Container(
            height: 27,
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_downward,
                  color: AppColors.RED,
                  size: 15,
                ),
                SizedBox(
                  width: 1,
                ),
                Text(
                  "${widget.percent}%",
                  style: TextStyle(color: AppColors.RED),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: AppColors.GLOW_RED,
              borderRadius: BorderRadius.circular(20),
            ),
          );
  }
}
