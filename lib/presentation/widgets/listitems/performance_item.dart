import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/presentation/widgets/container/persentageraond.dart';
import 'package:spice_tracker/presentation/widgets/container/title_subtitle_container.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:spice_tracker/core/app_colors.dart';
import 'package:spice_tracker/core/images_location.dart';

class PerformanceEngagementItem extends StatelessWidget {
  final String title;
  PerformanceEngagementItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.OFF_WHITE,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 14.h,
            ),
            Row(
              children: [
                Image.asset(
                  ImageLocations.date_range,
                  width: 20.h,
                  height: 18.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                _getValuepercent(),
                _getValuepercent(),
                _getValueRise()
              ],
            ),
            SizedBox(
              height: 22.h,
            ),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2,
                  mainAxisSpacing: 22,
                  crossAxisSpacing: 22),
              children: [
                // number with text item

                TitleSubTitleContainer(headTitle: "4", subtitle: "For the day"),
                TitleSubTitleContainer(
                    headTitle: "45", subtitle: "Month till date"),
                TitleSubTitleContainer(
                    headTitle: "35", subtitle: "Last month till date"),
                TitleSubTitleContainer(headTitle: "30", subtitle: "Last month"),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }

  _getValuepercent() {
    return Expanded(
      flex: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "45/",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "100",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w800))
            ])),
            Container(
              height: 10,
              child: StepProgressIndicator(
                totalSteps: 100,
                currentStep: 32,
                size: 2,
                padding: 0,
                selectedColor: Color(0xFF8676FE),
                unselectedColor: Color(0x338676FE),
                roundedEdges: Radius.circular(10),
              ),
            ),
            Text(
              "Achievement",
              style: TextStyle(fontSize: 12.sp, color: AppColors.BLACK_HEADING),
            )
          ],
        ),
      ),
    );
  }

  _getValueRise() {
    return Expanded(
      flex: 8,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PercentageRounded(
              percent: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Growth",
              style: TextStyle(fontSize: 12.sp, color: AppColors.BLACK_HEADING),
            )
          ],
        ),
      ),
    );
  }
}
